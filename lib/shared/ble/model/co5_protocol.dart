import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

/// Co5 UUIDs, commands, and framing confirmed by the scale documentation.
abstract final class Co5Protocol {
  static final serviceUuid = Uuid.parse('0000FFE0-0000-1000-8000-00805F9B34FB');
  static final notifyUuid = Uuid.parse('0000FFE1-0000-1000-8000-00805F9B34FB');
  static final writeUuid = Uuid.parse('0000FFE2-0000-1000-8000-00805F9B34FB');
  static const commands = <Co5Command, List<int>>{
    Co5Command.gross: [0x02, 0x41, 0x03],
    Co5Command.net: [0x02, 0x42, 0x03],
    Co5Command.tareWeight: [0x02, 0x43, 0x03],
    Co5Command.zero: [0x02, 0x44, 0x03],
    Co5Command.tare: [0x02, 0x45, 0x03],
  };
}

enum Co5Command { gross, net, tareWeight, zero, tare }
