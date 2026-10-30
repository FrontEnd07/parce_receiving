import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'package:parcel_receiving/entities/parcel/model/parcel_draft.dart';
import 'package:parcel_receiving/features/capture_photo/lib/photo_storage.dart';
import 'package:parcel_receiving/shared/database/app_database.dart';

class ParcelSaver {
  ParcelSaver(this._database);
  final AppDatabase _database;

  Future<void> save(ParcelDraft draft, {String? parcelId}) async {
    final path = await PhotoStorage().assignBarcode(
      draft.photoPath!,
      draft.barcode,
    );
    final prepared = draft.copyWith(photoPath: path);
    await _database.transaction(() async {
      final matches = await _database.parcelsByBarcode(prepared.barcode);
      final edited = parcelId == null
          ? null
          : await _database.parcelById(parcelId);
      final current = edited ?? (matches.isEmpty ? null : matches.first);
      await _database.saveParcel(
        ParcelsCompanion.insert(
          id: current?.id ?? const Uuid().v4(),
          barcode: prepared.barcode,
          warehouseId: 'diagnostic',
          employeeId: 'diagnostic',
          weightGrams: Value(prepared.weightGrams),
          rawWeight: Value(prepared.rawWeight),
          photoPath: Value(prepared.photoPath),
          scannedAt: prepared.scannedAt ?? DateTime.now(),
          revision: Value((current?.revision ?? 0) + 1),
          exportStatus: const Value('not_exported'),
        ),
      );
      await _database.deleteParcels(
        matches
            .where((parcel) => parcel.id != current?.id)
            .map((parcel) => parcel.id)
            .toList(),
      );
    });
  }
}
