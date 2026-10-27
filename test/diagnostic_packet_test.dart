import 'package:flutter_test/flutter_test.dart';
import 'package:parcel_receiving/shared/ble/lib/diagnostic_packet.dart';
import 'package:parcel_receiving/shared/ble/model/co5_protocol.dart';

void main() {
  test(
    'renders BLE data as lossless uppercase hexadecimal diagnostic output',
    () {
      final packet = DiagnosticPacket([0x02, 0x41, 0x03], DateTime(2026));
      expect(packet.hex, '02 41 03');
      expect(packet.ascii, '.A.');
    },
  );

  test('Co5 command bytes use the supplied protocol values', () {
    expect(Co5Protocol.commands[Co5Command.gross], [0x02, 0x41, 0x03]);
    expect(Co5Protocol.commands[Co5Command.zero], [0x02, 0x44, 0x03]);
  });
}
