import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../../../entities/scale/model/scale_device.dart';
import '../../../shared/ble/model/co5_protocol.dart';

class ReactiveBleTransport {
  ReactiveBleTransport({FlutterReactiveBle? ble})
    : _ble = ble ?? FlutterReactiveBle();
  final FlutterReactiveBle _ble;
  Stream<BleStatus> get status => _ble.statusStream;
  Stream<ScaleDevice> scan() => _ble
      .scanForDevices(withServices: const [], scanMode: ScanMode.lowLatency)
      .map(
        (device) =>
            ScaleDevice(id: device.id, name: device.name, rssi: device.rssi),
      );
  Stream<ConnectionStateUpdate> connect(String deviceId) =>
      _ble.connectToDevice(
        id: deviceId,
        connectionTimeout: const Duration(seconds: 12),
      );
  Stream<List<int>> notifications(String deviceId) =>
      _ble.subscribeToCharacteristic(
        QualifiedCharacteristic(
          serviceId: Co5Protocol.serviceUuid,
          characteristicId: Co5Protocol.notifyUuid,
          deviceId: deviceId,
        ),
      );
  Future<void> send(String deviceId, Co5Command command) =>
      _ble.writeCharacteristicWithResponse(
        QualifiedCharacteristic(
          serviceId: Co5Protocol.serviceUuid,
          characteristicId: Co5Protocol.writeUuid,
          deviceId: deviceId,
        ),
        value: Co5Protocol.commands[command]!,
      );
}
