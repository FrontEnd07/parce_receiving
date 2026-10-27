import 'dart:convert';

enum Co5WeightType { gross, net, tare }

class Co5Response {
  const Co5Response._({this.type, this.kilograms, this.acknowledgement});
  final Co5WeightType? type;
  final double? kilograms;
  final String? acknowledgement;
  int? get grams => kilograms == null ? null : (kilograms! * 1000).round();

  static Co5Response? parse(List<int> frame) {
    if (frame.length < 3 || frame.first != 0x02 || frame.last != 0x03) {
      return null;
    }
    final payload = ascii.decode(frame.sublist(1, frame.length - 1));
    if (payload == 'D' || payload == 'E') {
      return Co5Response._(acknowledgement: payload);
    }
    final match = RegExp(r'^(GW|NW|TW):([0-9]+(?:\.[0-9]+)?)\(kg\)$')
        .firstMatch(payload);
    if (match == null) return null;
    final type = switch (match.group(1)) {
      'GW' => Co5WeightType.gross,
      'NW' => Co5WeightType.net,
      _ => Co5WeightType.tare,
    };
    return Co5Response._(type: type, kilograms: double.parse(match.group(2)!));
  }
}
