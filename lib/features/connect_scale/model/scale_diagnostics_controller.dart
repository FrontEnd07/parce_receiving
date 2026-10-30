import 'dart:async';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcel_receiving/entities/scale/model/scale_device.dart';
import 'package:parcel_receiving/features/connect_scale/api/reactive_ble_transport.dart';
import 'package:parcel_receiving/shared/ble/lib/bluetooth_settings_launcher.dart';
import 'package:parcel_receiving/shared/ble/lib/ble_permissions.dart';
import 'package:parcel_receiving/shared/ble/lib/co5_diagnostics_decoder.dart';
import 'package:parcel_receiving/shared/ble/model/co5_protocol.dart';
import 'package:parcel_receiving/features/connect_scale/model/scale_diagnostics_state.dart';
final scaleDiagnosticsProvider =
    NotifierProvider<ScaleDiagnosticsController, ScaleDiagnosticsState>(
      ScaleDiagnosticsController.new,
    );
class ScaleDiagnosticsController extends Notifier<ScaleDiagnosticsState> {
  final _transport = ReactiveBleTransport();
  StreamSubscription<ScaleDevice>? _scan;
  StreamSubscription<ConnectionStateUpdate>? _connection;
  StreamSubscription<List<int>>? _notify;
  StreamSubscription<BleStatus>? _bleStatus;
  final _decoder = Co5DiagnosticsDecoder();
  @override
  ScaleDiagnosticsState build() {
    _bleStatus = _transport.status.listen((status) {
      if (status == BleStatus.poweredOff) {
        state = state.copyWith(
          error: 'Bluetooth disabled (code 1)',
          isScanning: false,
        );
      }
    });
    ref.onDispose(_dispose);
    return const ScaleDiagnosticsState();
  }
  Future<void> scan() async {
    if (!await BlePermissions.request()) {
      state = state.copyWith(error: 'Bluetooth permission was not granted.');
      return;
    }
    await _scan?.cancel();
    state = state.copyWith(isScanning: true, devices: [], clearError: true);
    _scan = _transport.scan().listen(
      (device) {
        final map = {for (final item in state.devices) item.id: item};
        map[device.id] = device;
        state = state.copyWith(
          devices: map.values.toList()
            ..sort((a, b) => b.rssi.compareTo(a.rssi)),
        );
      },
      onError: (Object error) =>
          state = state.copyWith(error: error.toString()),
      onDone: () => state = state.copyWith(isScanning: false),
    );
    Future<void>.delayed(const Duration(seconds: 10), stopScan);
  }
  Future<void> stopScan() async {
    await _scan?.cancel();
    _scan = null;
    state = state.copyWith(isScanning: false);
  }

  Future<void> connect(String deviceId) async {
    if (!await BlePermissions.request()) {
      state = state.copyWith(error: 'Bluetooth permissions are required.');
      return;
    }
    await stopScan();
    await _connection?.cancel();
    await _notify?.cancel();
    state = state.copyWith(
      connectedDeviceId: deviceId,
      isConnecting: true,
      clearError: true,
    );
    _connection = _transport.connect(deviceId).listen(
      (update) {
        final connected =
            update.connectionState == DeviceConnectionState.connected;
        state = state.copyWith(
          isConnected: connected,
          isConnecting:
              update.connectionState == DeviceConnectionState.connecting,
          clearDevice:
              update.connectionState == DeviceConnectionState.disconnected,
        );
        if (connected) _subscribe(deviceId);
      },
      onError: (Object error) => state = state.copyWith(
        error: error.toString(),
        isConnected: false,
        isConnecting: false,
        clearDevice: true,
      ),
    );
  }

  void _subscribe(String deviceId) {
    _notify?.cancel();
    _notify = _transport
        .notifications(deviceId)
        .listen(
          _receiveCo5Data,
          onError: (Object error) =>
              state = state.copyWith(error: error.toString()),
        );
  }

  void _receiveCo5Data(List<int> data) {
    final decoded = _decoder.add(data);
    if (decoded.packets.isEmpty) return;
    state = state.copyWith(
      log: [...state.log, ...decoded.packets],
      lastWeight: decoded.lastWeight,
    );
  }

  Future<void> send(Co5Command command) async {
    final id = state.connectedDeviceId;
    if (id == null || !state.isConnected) return;
    try {
      await _transport.send(id, command);
    } catch (error) {
      state = state.copyWith(error: error.toString());
    }
  }

  void clearLog() => state = state.copyWith(log: []);
  Future<void> openBluetoothSettings() => BluetoothSettingsLauncher.open();

  Future<void> disconnect() async {
    await _connection?.cancel();
    _connection = null;
    await _notify?.cancel();
    _notify = null;
    _decoder.reset();
    state = state.copyWith(
      isConnected: false,
      isConnecting: false,
      clearDevice: true,
    );
  }

  Future<void> _dispose() async {
    await _scan?.cancel();
    await _connection?.cancel();
    await _notify?.cancel();
    await _bleStatus?.cancel();
  }
}
