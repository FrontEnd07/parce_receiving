import 'package:parcel_receiving/shared/ble/lib/co5_frame_decoder.dart';
import 'package:parcel_receiving/shared/ble/lib/diagnostic_packet.dart';
import 'package:parcel_receiving/shared/ble/model/co5_response.dart';

class Co5DiagnosticsDecoder {
  final _frames = Co5FrameDecoder();

  Co5DiagnosticResult add(List<int> bytes) {
    Co5Response? lastWeight;
    final packets = _frames.add(bytes).map((frame) {
      final response = Co5Response.parse(frame);
      if (response?.kilograms != null) lastWeight = response;
      return DiagnosticPacket(frame, DateTime.now());
    }).toList();
    return Co5DiagnosticResult(packets: packets, lastWeight: lastWeight);
  }

  void reset() => _frames.clear();
}

class Co5DiagnosticResult {
  const Co5DiagnosticResult({required this.packets, this.lastWeight});
  final List<DiagnosticPacket> packets;
  final Co5Response? lastWeight;
}
