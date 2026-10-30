import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'package:parcel_receiving/shared/database/app_database.dart';
import 'package:parcel_receiving/shared/files/xlsx_export_builder.dart';

class ExportResult {
  const ExportResult({
    required this.path,
    required this.filename,
    required this.checksum,
    required this.count,
  });
  final String path;
  final String filename;
  final String checksum;
  final int count;
}

class ExportService {
  ExportService(this._database);
  final AppDatabase _database;

  Future<void> deleteExport(String path) async {
    final file = File(path);
    if (await file.exists()) await file.delete();
  }

  Future<int> deleteLocalExports() async {
    final directory = await getApplicationDocumentsDirectory();
    final exports = directory.listSync().whereType<File>().where(
      (file) =>
          RegExp(r'^DIAGNOSTIC_.*\.zip$').hasMatch(file.uri.pathSegments.last),
    );
    for (final file in exports) {
      await file.delete();
    }
    return exports.length;
  }

  Future<ExportResult> createCurrentExport() async {
    final parcels = _withoutDuplicateBarcodes(await _database.allParcels());
    final now = DateTime.now();
    final filename =
        'DIAGNOSTIC_${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}_${now.millisecondsSinceEpoch}.zip';
    final archive = Archive();
    final spreadsheet = XlsxExportBuilder().build(
      parcels
          .map(
            (item) => XlsxRow(
              trackingCode: item.barcode,
              weightGrams: item.weightGrams,
              scannedAt: item.scannedAt,
            ),
          )
          .toList(),
    );
    archive.addFile(
      ArchiveFile('parcels.xlsx', spreadsheet.length, spreadsheet),
    );
    final manifest = jsonEncode({
      'formatVersion': 1,
      'createdAt': now.toIso8601String(),
      'parcelCount': parcels.length,
      'photos': parcels
          .where((item) => item.photoPath != null)
          .map(
            (item) => {
              'parcelId': item.id,
              'path': 'photos/${_photoName(item)}',
            },
          )
          .toList(),
    });
    archive.addFile(
      ArchiveFile(
        'manifest.json',
        utf8.encode(manifest).length,
        utf8.encode(manifest),
      ),
    );
    for (final parcel in parcels) {
      final photo = parcel.photoPath;
      if (photo != null && await File(photo).exists()) {
        final bytes = await File(photo).readAsBytes();
        archive.addFile(
          ArchiveFile('photos/${_photoName(parcel)}', bytes.length, bytes),
        );
      }
    }
    final bytes = ZipEncoder().encode(archive);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}${Platform.pathSeparator}$filename');
    await file.writeAsBytes(bytes, flush: true);
    final checksum = sha256.convert(bytes).toString();
    final batchId = const Uuid().v4();
    await _database.transaction(() async {
      await _database.saveExportBatch(
        ExportBatchesCompanion.insert(
          id: batchId,
          filename: filename,
          warehouseId: 'diagnostic',
          createdAt: now,
          parcelCount: parcels.length,
          checksum: checksum,
        ),
      );
      await _database.markExported(parcels.map((item) => item.id).toList());
    });
    return ExportResult(
      path: file.path,
      filename: filename,
      checksum: checksum,
      count: parcels.length,
    );
  }

  String _photoName(Parcel parcel) =>
      '${parcel.barcode.replaceAll(RegExp(r'[^A-Za-z0-9_-]'), '_')}.jpg';

  List<Parcel> _withoutDuplicateBarcodes(List<Parcel> parcels) {
    final barcodes = <String>{};
    return parcels.where((parcel) => barcodes.add(parcel.barcode)).toList();
  }
}
