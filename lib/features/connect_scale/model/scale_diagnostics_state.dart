import 'package:parcel_receiving/entities/scale/model/scale_device.dart';
import 'package:parcel_receiving/shared/ble/lib/diagnostic_packet.dart';
import 'package:parcel_receiving/shared/ble/model/co5_response.dart';

class ScaleDiagnosticsState {
  const ScaleDiagnosticsState({
    this.devices = const [],
    this.isScanning = false,
    this.isConnecting = false,
    this.isConnected = false,
    this.connectedDeviceId,
    this.log = const [],
    this.lastWeight,
    this.error,
  });
  final List<ScaleDevice> devices;
  final bool isScanning;
  final bool isConnecting;
  final bool isConnected;
  final String? connectedDeviceId;
  final List<DiagnosticPacket> log;
  final Co5Response? lastWeight;
  final String? error;

  ScaleDiagnosticsState copyWith({
    List<ScaleDevice>? devices,
    bool? isScanning,
    bool? isConnecting,
    bool? isConnected,
    String? connectedDeviceId,
    bool clearDevice = false,
    List<DiagnosticPacket>? log,
    Co5Response? lastWeight,
    String? error,
    bool clearError = false,
  }) => ScaleDiagnosticsState(
    devices: devices ?? this.devices,
    isScanning: isScanning ?? this.isScanning,
    isConnecting: isConnecting ?? this.isConnecting,
    isConnected: isConnected ?? this.isConnected,
    connectedDeviceId: clearDevice
        ? null
        : connectedDeviceId ?? this.connectedDeviceId,
    log: log ?? this.log,
    lastWeight: lastWeight ?? this.lastWeight,
    error: clearError ? null : error ?? this.error,
  );
}
