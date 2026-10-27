import 'package:flutter_test/flutter_test.dart';
import 'package:parcel_receiving/shared/ble/lib/co5_diagnostics_decoder.dart';
import 'package:parcel_receiving/shared/ble/model/co5_protocol.dart';

void main() {
  test('uses all five documented Co5 command byte sequences', () {
    expect(Co5Protocol.commands[Co5Command.tareWeight], [0x02, 0x43, 0x03]);
    expect(Co5Protocol.commands[Co5Command.zero], [0x02, 0x44, 0x03]);
    expect(Co5Protocol.commands[Co5Command.tare], [0x02, 0x45, 0x03]);
  });

  test('decodes a fragmented documented gross-weight response', () {
    final decoder = Co5DiagnosticsDecoder();
    expect(decoder.add([0x02, 0x47, 0x57, 0x3A]).packets, isEmpty);
    final result = decoder.add([
      0x30,
      0x30,
      0x32,
      0x33,
      0x2E,
      0x34,
      0x35,
      0x28,
      0x6B,
      0x67,
      0x29,
      0x03,
    ]);
    expect(result.lastWeight?.kilograms, 23.45);
    expect(result.lastWeight?.grams, 23450);
    expect(result.packets.single.ascii, '.GW:0023.45(kg).');
  });
}
