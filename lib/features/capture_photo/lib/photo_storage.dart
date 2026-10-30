import 'dart:io';

import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

class PhotoStorage {
  Future<String> save(XFile source, String? barcode) async {
    final directory = await getApplicationDocumentsDirectory();
    final photos = Directory(
      '${directory.path}${Platform.pathSeparator}photos',
    );
    await photos.create(recursive: true);
    final filename = barcode?.trim().isNotEmpty == true
        ? barcode!
        : 'unrecognized_${DateTime.now().microsecondsSinceEpoch}';
    final safeBarcode = filename.replaceAll(RegExp(r'[^A-Za-z0-9_-]'), '_');
    final path = '${photos.path}${Platform.pathSeparator}$safeBarcode.jpg';
    return (await File(source.path).copy(path)).path;
  }

  Future<String> assignBarcode(String path, String barcode) async {
    final source = File(path);
    final safeBarcode = barcode.replaceAll(RegExp(r'[^A-Za-z0-9_-]'), '_');
    final target = File(
      '${source.parent.path}${Platform.pathSeparator}$safeBarcode.jpg',
    );
    if (source.path == target.path) return path;
    await source.copy(target.path);
    await source.delete();
    return target.path;
  }
}
