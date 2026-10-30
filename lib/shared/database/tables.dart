import 'package:drift/drift.dart';

class Parcels extends Table {
  TextColumn get id => text()();
  TextColumn get barcode => text()();
  TextColumn get warehouseId => text()();
  TextColumn get employeeId => text()();
  IntColumn get weightGrams => integer().nullable()();
  TextColumn get rawWeight => text().nullable()();
  TextColumn get photoPath => text().nullable()();
  DateTimeColumn get scannedAt => dateTime()();
  TextColumn get receptionStatus =>
      text().withDefault(const Constant('completed'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  TextColumn get exportStatus =>
      text().withDefault(const Constant('not_exported'))();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class ExportBatches extends Table {
  TextColumn get id => text()();
  TextColumn get filename => text()();
  TextColumn get warehouseId => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get parcelCount => integer()();
  TextColumn get checksum => text()();
  TextColumn get deliveryStatus =>
      text().withDefault(const Constant('unknown'))();
  @override
  Set<Column<Object>> get primaryKey => {id};
}
