class Co5FrameDecoder {
  final List<int> _buffer = [];

  List<List<int>> add(List<int> bytes) {
    _buffer.addAll(bytes);
    final frames = <List<int>>[];
    while (true) {
      final start = _buffer.indexOf(0x02);
      if (start < 0) {
        _buffer.clear();
        break;
      }
      if (start > 0) _buffer.removeRange(0, start);
      final end = _buffer.indexOf(0x03, 1);
      if (end < 0) break;
      frames.add(List<int>.from(_buffer.take(end + 1)));
      _buffer.removeRange(0, end + 1);
    }
    return frames;
  }

  void clear() => _buffer.clear();
}
