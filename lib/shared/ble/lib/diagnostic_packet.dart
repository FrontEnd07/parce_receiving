import 'dart:convert' as convert;

class DiagnosticPacket {
  const DiagnosticPacket(this.bytes, this.receivedAt);
  final List<int> bytes;
  final DateTime receivedAt;
  String get hex => bytes
      .map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase())
      .join(' ');
  String get ascii => convert.ascii.decode(
    bytes.map((byte) => byte >= 32 && byte <= 126 ? byte : 0x2E).toList(),
  );
}
