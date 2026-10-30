import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Parcels, ExportBatches])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'parcel_receiving'));

  @override
  int get schemaVersion => 1;

  Stream<List<Parcel>> watchParcels() => (select(
    parcels,
  )..orderBy([(item) => OrderingTerm.desc(item.scannedAt)])).watch();
  Future<List<Parcel>> allParcels() => (select(
    parcels,
  )..orderBy([(item) => OrderingTerm.desc(item.scannedAt)])).get();
  Future<List<Parcel>> parcelsByBarcode(String barcode) =>
      (select(parcels)
            ..where((item) => item.barcode.equals(barcode))
            ..orderBy([(item) => OrderingTerm.desc(item.scannedAt)]))
          .get();
  Future<Parcel?> parcelById(String id) =>
      (select(parcels)..where((item) => item.id.equals(id))).getSingleOrNull();
  Future<List<Parcel>> parcelsByIds(List<String> ids) =>
      (select(parcels)..where((item) => item.id.isIn(ids))).get();
  Future<void> saveParcel(ParcelsCompanion parcel) =>
      into(parcels).insert(parcel, mode: InsertMode.insertOrReplace);
  Future<void> deleteParcels(List<String> ids) async {
    if (ids.isEmpty) return;
    await (delete(parcels)..where((item) => item.id.isIn(ids))).go();
  }

  Future<void> markExported(List<String> ids) =>
      (update(parcels)..where((item) => item.id.isIn(ids))).write(
        const ParcelsCompanion(exportStatus: Value('exported')),
      );
  Future<void> saveExportBatch(ExportBatchesCompanion batch) =>
      into(exportBatches).insert(batch);
}
