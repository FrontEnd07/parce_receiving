// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ParcelsTable extends Parcels with TableInfo<$ParcelsTable, Parcel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParcelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _warehouseIdMeta = const VerificationMeta(
    'warehouseId',
  );
  @override
  late final GeneratedColumn<String> warehouseId = GeneratedColumn<String>(
    'warehouse_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _employeeIdMeta = const VerificationMeta(
    'employeeId',
  );
  @override
  late final GeneratedColumn<String> employeeId = GeneratedColumn<String>(
    'employee_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightGramsMeta = const VerificationMeta(
    'weightGrams',
  );
  @override
  late final GeneratedColumn<int> weightGrams = GeneratedColumn<int>(
    'weight_grams',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawWeightMeta = const VerificationMeta(
    'rawWeight',
  );
  @override
  late final GeneratedColumn<String> rawWeight = GeneratedColumn<String>(
    'raw_weight',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scannedAtMeta = const VerificationMeta(
    'scannedAt',
  );
  @override
  late final GeneratedColumn<DateTime> scannedAt = GeneratedColumn<DateTime>(
    'scanned_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _receptionStatusMeta = const VerificationMeta(
    'receptionStatus',
  );
  @override
  late final GeneratedColumn<String> receptionStatus = GeneratedColumn<String>(
    'reception_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('completed'),
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<int> revision = GeneratedColumn<int>(
    'revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _exportStatusMeta = const VerificationMeta(
    'exportStatus',
  );
  @override
  late final GeneratedColumn<String> exportStatus = GeneratedColumn<String>(
    'export_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('not_exported'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    barcode,
    warehouseId,
    employeeId,
    weightGrams,
    rawWeight,
    photoPath,
    scannedAt,
    receptionStatus,
    revision,
    exportStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parcels';
  @override
  VerificationContext validateIntegrity(
    Insertable<Parcel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('warehouse_id')) {
      context.handle(
        _warehouseIdMeta,
        warehouseId.isAcceptableOrUnknown(
          data['warehouse_id']!,
          _warehouseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warehouseIdMeta);
    }
    if (data.containsKey('employee_id')) {
      context.handle(
        _employeeIdMeta,
        employeeId.isAcceptableOrUnknown(data['employee_id']!, _employeeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('weight_grams')) {
      context.handle(
        _weightGramsMeta,
        weightGrams.isAcceptableOrUnknown(
          data['weight_grams']!,
          _weightGramsMeta,
        ),
      );
    }
    if (data.containsKey('raw_weight')) {
      context.handle(
        _rawWeightMeta,
        rawWeight.isAcceptableOrUnknown(data['raw_weight']!, _rawWeightMeta),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('scanned_at')) {
      context.handle(
        _scannedAtMeta,
        scannedAt.isAcceptableOrUnknown(data['scanned_at']!, _scannedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_scannedAtMeta);
    }
    if (data.containsKey('reception_status')) {
      context.handle(
        _receptionStatusMeta,
        receptionStatus.isAcceptableOrUnknown(
          data['reception_status']!,
          _receptionStatusMeta,
        ),
      );
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    if (data.containsKey('export_status')) {
      context.handle(
        _exportStatusMeta,
        exportStatus.isAcceptableOrUnknown(
          data['export_status']!,
          _exportStatusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Parcel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Parcel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      )!,
      warehouseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warehouse_id'],
      )!,
      employeeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}employee_id'],
      )!,
      weightGrams: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weight_grams'],
      ),
      rawWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_weight'],
      ),
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      scannedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scanned_at'],
      )!,
      receptionStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reception_status'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revision'],
      )!,
      exportStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}export_status'],
      )!,
    );
  }

  @override
  $ParcelsTable createAlias(String alias) {
    return $ParcelsTable(attachedDatabase, alias);
  }
}

class Parcel extends DataClass implements Insertable<Parcel> {
  final String id;
  final String barcode;
  final String warehouseId;
  final String employeeId;
  final int? weightGrams;
  final String? rawWeight;
  final String? photoPath;
  final DateTime scannedAt;
  final String receptionStatus;
  final int revision;
  final String exportStatus;
  const Parcel({
    required this.id,
    required this.barcode,
    required this.warehouseId,
    required this.employeeId,
    this.weightGrams,
    this.rawWeight,
    this.photoPath,
    required this.scannedAt,
    required this.receptionStatus,
    required this.revision,
    required this.exportStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['barcode'] = Variable<String>(barcode);
    map['warehouse_id'] = Variable<String>(warehouseId);
    map['employee_id'] = Variable<String>(employeeId);
    if (!nullToAbsent || weightGrams != null) {
      map['weight_grams'] = Variable<int>(weightGrams);
    }
    if (!nullToAbsent || rawWeight != null) {
      map['raw_weight'] = Variable<String>(rawWeight);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['scanned_at'] = Variable<DateTime>(scannedAt);
    map['reception_status'] = Variable<String>(receptionStatus);
    map['revision'] = Variable<int>(revision);
    map['export_status'] = Variable<String>(exportStatus);
    return map;
  }

  ParcelsCompanion toCompanion(bool nullToAbsent) {
    return ParcelsCompanion(
      id: Value(id),
      barcode: Value(barcode),
      warehouseId: Value(warehouseId),
      employeeId: Value(employeeId),
      weightGrams: weightGrams == null && nullToAbsent
          ? const Value.absent()
          : Value(weightGrams),
      rawWeight: rawWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(rawWeight),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      scannedAt: Value(scannedAt),
      receptionStatus: Value(receptionStatus),
      revision: Value(revision),
      exportStatus: Value(exportStatus),
    );
  }

  factory Parcel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Parcel(
      id: serializer.fromJson<String>(json['id']),
      barcode: serializer.fromJson<String>(json['barcode']),
      warehouseId: serializer.fromJson<String>(json['warehouseId']),
      employeeId: serializer.fromJson<String>(json['employeeId']),
      weightGrams: serializer.fromJson<int?>(json['weightGrams']),
      rawWeight: serializer.fromJson<String?>(json['rawWeight']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      scannedAt: serializer.fromJson<DateTime>(json['scannedAt']),
      receptionStatus: serializer.fromJson<String>(json['receptionStatus']),
      revision: serializer.fromJson<int>(json['revision']),
      exportStatus: serializer.fromJson<String>(json['exportStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'barcode': serializer.toJson<String>(barcode),
      'warehouseId': serializer.toJson<String>(warehouseId),
      'employeeId': serializer.toJson<String>(employeeId),
      'weightGrams': serializer.toJson<int?>(weightGrams),
      'rawWeight': serializer.toJson<String?>(rawWeight),
      'photoPath': serializer.toJson<String?>(photoPath),
      'scannedAt': serializer.toJson<DateTime>(scannedAt),
      'receptionStatus': serializer.toJson<String>(receptionStatus),
      'revision': serializer.toJson<int>(revision),
      'exportStatus': serializer.toJson<String>(exportStatus),
    };
  }

  Parcel copyWith({
    String? id,
    String? barcode,
    String? warehouseId,
    String? employeeId,
    Value<int?> weightGrams = const Value.absent(),
    Value<String?> rawWeight = const Value.absent(),
    Value<String?> photoPath = const Value.absent(),
    DateTime? scannedAt,
    String? receptionStatus,
    int? revision,
    String? exportStatus,
  }) => Parcel(
    id: id ?? this.id,
    barcode: barcode ?? this.barcode,
    warehouseId: warehouseId ?? this.warehouseId,
    employeeId: employeeId ?? this.employeeId,
    weightGrams: weightGrams.present ? weightGrams.value : this.weightGrams,
    rawWeight: rawWeight.present ? rawWeight.value : this.rawWeight,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    scannedAt: scannedAt ?? this.scannedAt,
    receptionStatus: receptionStatus ?? this.receptionStatus,
    revision: revision ?? this.revision,
    exportStatus: exportStatus ?? this.exportStatus,
  );
  Parcel copyWithCompanion(ParcelsCompanion data) {
    return Parcel(
      id: data.id.present ? data.id.value : this.id,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      warehouseId: data.warehouseId.present
          ? data.warehouseId.value
          : this.warehouseId,
      employeeId: data.employeeId.present
          ? data.employeeId.value
          : this.employeeId,
      weightGrams: data.weightGrams.present
          ? data.weightGrams.value
          : this.weightGrams,
      rawWeight: data.rawWeight.present ? data.rawWeight.value : this.rawWeight,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      scannedAt: data.scannedAt.present ? data.scannedAt.value : this.scannedAt,
      receptionStatus: data.receptionStatus.present
          ? data.receptionStatus.value
          : this.receptionStatus,
      revision: data.revision.present ? data.revision.value : this.revision,
      exportStatus: data.exportStatus.present
          ? data.exportStatus.value
          : this.exportStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Parcel(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('warehouseId: $warehouseId, ')
          ..write('employeeId: $employeeId, ')
          ..write('weightGrams: $weightGrams, ')
          ..write('rawWeight: $rawWeight, ')
          ..write('photoPath: $photoPath, ')
          ..write('scannedAt: $scannedAt, ')
          ..write('receptionStatus: $receptionStatus, ')
          ..write('revision: $revision, ')
          ..write('exportStatus: $exportStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    barcode,
    warehouseId,
    employeeId,
    weightGrams,
    rawWeight,
    photoPath,
    scannedAt,
    receptionStatus,
    revision,
    exportStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Parcel &&
          other.id == this.id &&
          other.barcode == this.barcode &&
          other.warehouseId == this.warehouseId &&
          other.employeeId == this.employeeId &&
          other.weightGrams == this.weightGrams &&
          other.rawWeight == this.rawWeight &&
          other.photoPath == this.photoPath &&
          other.scannedAt == this.scannedAt &&
          other.receptionStatus == this.receptionStatus &&
          other.revision == this.revision &&
          other.exportStatus == this.exportStatus);
}

class ParcelsCompanion extends UpdateCompanion<Parcel> {
  final Value<String> id;
  final Value<String> barcode;
  final Value<String> warehouseId;
  final Value<String> employeeId;
  final Value<int?> weightGrams;
  final Value<String?> rawWeight;
  final Value<String?> photoPath;
  final Value<DateTime> scannedAt;
  final Value<String> receptionStatus;
  final Value<int> revision;
  final Value<String> exportStatus;
  final Value<int> rowid;
  const ParcelsCompanion({
    this.id = const Value.absent(),
    this.barcode = const Value.absent(),
    this.warehouseId = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.weightGrams = const Value.absent(),
    this.rawWeight = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.scannedAt = const Value.absent(),
    this.receptionStatus = const Value.absent(),
    this.revision = const Value.absent(),
    this.exportStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ParcelsCompanion.insert({
    required String id,
    required String barcode,
    required String warehouseId,
    required String employeeId,
    this.weightGrams = const Value.absent(),
    this.rawWeight = const Value.absent(),
    this.photoPath = const Value.absent(),
    required DateTime scannedAt,
    this.receptionStatus = const Value.absent(),
    this.revision = const Value.absent(),
    this.exportStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       barcode = Value(barcode),
       warehouseId = Value(warehouseId),
       employeeId = Value(employeeId),
       scannedAt = Value(scannedAt);
  static Insertable<Parcel> custom({
    Expression<String>? id,
    Expression<String>? barcode,
    Expression<String>? warehouseId,
    Expression<String>? employeeId,
    Expression<int>? weightGrams,
    Expression<String>? rawWeight,
    Expression<String>? photoPath,
    Expression<DateTime>? scannedAt,
    Expression<String>? receptionStatus,
    Expression<int>? revision,
    Expression<String>? exportStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (barcode != null) 'barcode': barcode,
      if (warehouseId != null) 'warehouse_id': warehouseId,
      if (employeeId != null) 'employee_id': employeeId,
      if (weightGrams != null) 'weight_grams': weightGrams,
      if (rawWeight != null) 'raw_weight': rawWeight,
      if (photoPath != null) 'photo_path': photoPath,
      if (scannedAt != null) 'scanned_at': scannedAt,
      if (receptionStatus != null) 'reception_status': receptionStatus,
      if (revision != null) 'revision': revision,
      if (exportStatus != null) 'export_status': exportStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ParcelsCompanion copyWith({
    Value<String>? id,
    Value<String>? barcode,
    Value<String>? warehouseId,
    Value<String>? employeeId,
    Value<int?>? weightGrams,
    Value<String?>? rawWeight,
    Value<String?>? photoPath,
    Value<DateTime>? scannedAt,
    Value<String>? receptionStatus,
    Value<int>? revision,
    Value<String>? exportStatus,
    Value<int>? rowid,
  }) {
    return ParcelsCompanion(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      warehouseId: warehouseId ?? this.warehouseId,
      employeeId: employeeId ?? this.employeeId,
      weightGrams: weightGrams ?? this.weightGrams,
      rawWeight: rawWeight ?? this.rawWeight,
      photoPath: photoPath ?? this.photoPath,
      scannedAt: scannedAt ?? this.scannedAt,
      receptionStatus: receptionStatus ?? this.receptionStatus,
      revision: revision ?? this.revision,
      exportStatus: exportStatus ?? this.exportStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (warehouseId.present) {
      map['warehouse_id'] = Variable<String>(warehouseId.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<String>(employeeId.value);
    }
    if (weightGrams.present) {
      map['weight_grams'] = Variable<int>(weightGrams.value);
    }
    if (rawWeight.present) {
      map['raw_weight'] = Variable<String>(rawWeight.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (scannedAt.present) {
      map['scanned_at'] = Variable<DateTime>(scannedAt.value);
    }
    if (receptionStatus.present) {
      map['reception_status'] = Variable<String>(receptionStatus.value);
    }
    if (revision.present) {
      map['revision'] = Variable<int>(revision.value);
    }
    if (exportStatus.present) {
      map['export_status'] = Variable<String>(exportStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParcelsCompanion(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('warehouseId: $warehouseId, ')
          ..write('employeeId: $employeeId, ')
          ..write('weightGrams: $weightGrams, ')
          ..write('rawWeight: $rawWeight, ')
          ..write('photoPath: $photoPath, ')
          ..write('scannedAt: $scannedAt, ')
          ..write('receptionStatus: $receptionStatus, ')
          ..write('revision: $revision, ')
          ..write('exportStatus: $exportStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExportBatchesTable extends ExportBatches
    with TableInfo<$ExportBatchesTable, ExportBatche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExportBatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filenameMeta = const VerificationMeta(
    'filename',
  );
  @override
  late final GeneratedColumn<String> filename = GeneratedColumn<String>(
    'filename',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _warehouseIdMeta = const VerificationMeta(
    'warehouseId',
  );
  @override
  late final GeneratedColumn<String> warehouseId = GeneratedColumn<String>(
    'warehouse_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parcelCountMeta = const VerificationMeta(
    'parcelCount',
  );
  @override
  late final GeneratedColumn<int> parcelCount = GeneratedColumn<int>(
    'parcel_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checksumMeta = const VerificationMeta(
    'checksum',
  );
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
    'checksum',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deliveryStatusMeta = const VerificationMeta(
    'deliveryStatus',
  );
  @override
  late final GeneratedColumn<String> deliveryStatus = GeneratedColumn<String>(
    'delivery_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unknown'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    filename,
    warehouseId,
    createdAt,
    parcelCount,
    checksum,
    deliveryStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'export_batches';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExportBatche> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('filename')) {
      context.handle(
        _filenameMeta,
        filename.isAcceptableOrUnknown(data['filename']!, _filenameMeta),
      );
    } else if (isInserting) {
      context.missing(_filenameMeta);
    }
    if (data.containsKey('warehouse_id')) {
      context.handle(
        _warehouseIdMeta,
        warehouseId.isAcceptableOrUnknown(
          data['warehouse_id']!,
          _warehouseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warehouseIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('parcel_count')) {
      context.handle(
        _parcelCountMeta,
        parcelCount.isAcceptableOrUnknown(
          data['parcel_count']!,
          _parcelCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_parcelCountMeta);
    }
    if (data.containsKey('checksum')) {
      context.handle(
        _checksumMeta,
        checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta),
      );
    } else if (isInserting) {
      context.missing(_checksumMeta);
    }
    if (data.containsKey('delivery_status')) {
      context.handle(
        _deliveryStatusMeta,
        deliveryStatus.isAcceptableOrUnknown(
          data['delivery_status']!,
          _deliveryStatusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExportBatche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExportBatche(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      filename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filename'],
      )!,
      warehouseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warehouse_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      parcelCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parcel_count'],
      )!,
      checksum: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checksum'],
      )!,
      deliveryStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}delivery_status'],
      )!,
    );
  }

  @override
  $ExportBatchesTable createAlias(String alias) {
    return $ExportBatchesTable(attachedDatabase, alias);
  }
}

class ExportBatche extends DataClass implements Insertable<ExportBatche> {
  final String id;
  final String filename;
  final String warehouseId;
  final DateTime createdAt;
  final int parcelCount;
  final String checksum;
  final String deliveryStatus;
  const ExportBatche({
    required this.id,
    required this.filename,
    required this.warehouseId,
    required this.createdAt,
    required this.parcelCount,
    required this.checksum,
    required this.deliveryStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['filename'] = Variable<String>(filename);
    map['warehouse_id'] = Variable<String>(warehouseId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['parcel_count'] = Variable<int>(parcelCount);
    map['checksum'] = Variable<String>(checksum);
    map['delivery_status'] = Variable<String>(deliveryStatus);
    return map;
  }

  ExportBatchesCompanion toCompanion(bool nullToAbsent) {
    return ExportBatchesCompanion(
      id: Value(id),
      filename: Value(filename),
      warehouseId: Value(warehouseId),
      createdAt: Value(createdAt),
      parcelCount: Value(parcelCount),
      checksum: Value(checksum),
      deliveryStatus: Value(deliveryStatus),
    );
  }

  factory ExportBatche.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExportBatche(
      id: serializer.fromJson<String>(json['id']),
      filename: serializer.fromJson<String>(json['filename']),
      warehouseId: serializer.fromJson<String>(json['warehouseId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      parcelCount: serializer.fromJson<int>(json['parcelCount']),
      checksum: serializer.fromJson<String>(json['checksum']),
      deliveryStatus: serializer.fromJson<String>(json['deliveryStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'filename': serializer.toJson<String>(filename),
      'warehouseId': serializer.toJson<String>(warehouseId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'parcelCount': serializer.toJson<int>(parcelCount),
      'checksum': serializer.toJson<String>(checksum),
      'deliveryStatus': serializer.toJson<String>(deliveryStatus),
    };
  }

  ExportBatche copyWith({
    String? id,
    String? filename,
    String? warehouseId,
    DateTime? createdAt,
    int? parcelCount,
    String? checksum,
    String? deliveryStatus,
  }) => ExportBatche(
    id: id ?? this.id,
    filename: filename ?? this.filename,
    warehouseId: warehouseId ?? this.warehouseId,
    createdAt: createdAt ?? this.createdAt,
    parcelCount: parcelCount ?? this.parcelCount,
    checksum: checksum ?? this.checksum,
    deliveryStatus: deliveryStatus ?? this.deliveryStatus,
  );
  ExportBatche copyWithCompanion(ExportBatchesCompanion data) {
    return ExportBatche(
      id: data.id.present ? data.id.value : this.id,
      filename: data.filename.present ? data.filename.value : this.filename,
      warehouseId: data.warehouseId.present
          ? data.warehouseId.value
          : this.warehouseId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      parcelCount: data.parcelCount.present
          ? data.parcelCount.value
          : this.parcelCount,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      deliveryStatus: data.deliveryStatus.present
          ? data.deliveryStatus.value
          : this.deliveryStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExportBatche(')
          ..write('id: $id, ')
          ..write('filename: $filename, ')
          ..write('warehouseId: $warehouseId, ')
          ..write('createdAt: $createdAt, ')
          ..write('parcelCount: $parcelCount, ')
          ..write('checksum: $checksum, ')
          ..write('deliveryStatus: $deliveryStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    filename,
    warehouseId,
    createdAt,
    parcelCount,
    checksum,
    deliveryStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExportBatche &&
          other.id == this.id &&
          other.filename == this.filename &&
          other.warehouseId == this.warehouseId &&
          other.createdAt == this.createdAt &&
          other.parcelCount == this.parcelCount &&
          other.checksum == this.checksum &&
          other.deliveryStatus == this.deliveryStatus);
}

class ExportBatchesCompanion extends UpdateCompanion<ExportBatche> {
  final Value<String> id;
  final Value<String> filename;
  final Value<String> warehouseId;
  final Value<DateTime> createdAt;
  final Value<int> parcelCount;
  final Value<String> checksum;
  final Value<String> deliveryStatus;
  final Value<int> rowid;
  const ExportBatchesCompanion({
    this.id = const Value.absent(),
    this.filename = const Value.absent(),
    this.warehouseId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.parcelCount = const Value.absent(),
    this.checksum = const Value.absent(),
    this.deliveryStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExportBatchesCompanion.insert({
    required String id,
    required String filename,
    required String warehouseId,
    required DateTime createdAt,
    required int parcelCount,
    required String checksum,
    this.deliveryStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       filename = Value(filename),
       warehouseId = Value(warehouseId),
       createdAt = Value(createdAt),
       parcelCount = Value(parcelCount),
       checksum = Value(checksum);
  static Insertable<ExportBatche> custom({
    Expression<String>? id,
    Expression<String>? filename,
    Expression<String>? warehouseId,
    Expression<DateTime>? createdAt,
    Expression<int>? parcelCount,
    Expression<String>? checksum,
    Expression<String>? deliveryStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (filename != null) 'filename': filename,
      if (warehouseId != null) 'warehouse_id': warehouseId,
      if (createdAt != null) 'created_at': createdAt,
      if (parcelCount != null) 'parcel_count': parcelCount,
      if (checksum != null) 'checksum': checksum,
      if (deliveryStatus != null) 'delivery_status': deliveryStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExportBatchesCompanion copyWith({
    Value<String>? id,
    Value<String>? filename,
    Value<String>? warehouseId,
    Value<DateTime>? createdAt,
    Value<int>? parcelCount,
    Value<String>? checksum,
    Value<String>? deliveryStatus,
    Value<int>? rowid,
  }) {
    return ExportBatchesCompanion(
      id: id ?? this.id,
      filename: filename ?? this.filename,
      warehouseId: warehouseId ?? this.warehouseId,
      createdAt: createdAt ?? this.createdAt,
      parcelCount: parcelCount ?? this.parcelCount,
      checksum: checksum ?? this.checksum,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (filename.present) {
      map['filename'] = Variable<String>(filename.value);
    }
    if (warehouseId.present) {
      map['warehouse_id'] = Variable<String>(warehouseId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (parcelCount.present) {
      map['parcel_count'] = Variable<int>(parcelCount.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (deliveryStatus.present) {
      map['delivery_status'] = Variable<String>(deliveryStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExportBatchesCompanion(')
          ..write('id: $id, ')
          ..write('filename: $filename, ')
          ..write('warehouseId: $warehouseId, ')
          ..write('createdAt: $createdAt, ')
          ..write('parcelCount: $parcelCount, ')
          ..write('checksum: $checksum, ')
          ..write('deliveryStatus: $deliveryStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ParcelsTable parcels = $ParcelsTable(this);
  late final $ExportBatchesTable exportBatches = $ExportBatchesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [parcels, exportBatches];
}

typedef $$ParcelsTableCreateCompanionBuilder = ParcelsCompanion Function({
  required String id,
  required String barcode,
  required String warehouseId,
  required String employeeId,
  Value<int?> weightGrams,
  Value<String?> rawWeight,
  Value<String?> photoPath,
  required DateTime scannedAt,
  Value<String> receptionStatus,
  Value<int> revision,
  Value<String> exportStatus,
  Value<int> rowid,
});
typedef $$ParcelsTableUpdateCompanionBuilder = ParcelsCompanion Function({
  Value<String> id,
  Value<String> barcode,
  Value<String> warehouseId,
  Value<String> employeeId,
  Value<int?> weightGrams,
  Value<String?> rawWeight,
  Value<String?> photoPath,
  Value<DateTime> scannedAt,
  Value<String> receptionStatus,
  Value<int> revision,
  Value<String> exportStatus,
  Value<int> rowid,
});

class $$ParcelsTableFilterComposer
    extends Composer<_$AppDatabase, $ParcelsTable> {
  $$ParcelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warehouseId => $composableBuilder(
    column: $table.warehouseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get employeeId => $composableBuilder(
    column: $table.employeeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weightGrams => $composableBuilder(
    column: $table.weightGrams,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawWeight => $composableBuilder(
    column: $table.rawWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scannedAt => $composableBuilder(
    column: $table.scannedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receptionStatus => $composableBuilder(
    column: $table.receptionStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exportStatus => $composableBuilder(
    column: $table.exportStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ParcelsTableOrderingComposer
    extends Composer<_$AppDatabase, $ParcelsTable> {
  $$ParcelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warehouseId => $composableBuilder(
    column: $table.warehouseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get employeeId => $composableBuilder(
    column: $table.employeeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weightGrams => $composableBuilder(
    column: $table.weightGrams,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawWeight => $composableBuilder(
    column: $table.rawWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scannedAt => $composableBuilder(
    column: $table.scannedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receptionStatus => $composableBuilder(
    column: $table.receptionStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exportStatus => $composableBuilder(
    column: $table.exportStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ParcelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParcelsTable> {
  $$ParcelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get warehouseId => $composableBuilder(
    column: $table.warehouseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get employeeId => $composableBuilder(
    column: $table.employeeId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get weightGrams => $composableBuilder(
    column: $table.weightGrams,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rawWeight =>
      $composableBuilder(column: $table.rawWeight, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<DateTime> get scannedAt =>
      $composableBuilder(column: $table.scannedAt, builder: (column) => column);

  GeneratedColumn<String> get receptionStatus => $composableBuilder(
    column: $table.receptionStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);

  GeneratedColumn<String> get exportStatus => $composableBuilder(
    column: $table.exportStatus,
    builder: (column) => column,
  );
}

class $$ParcelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParcelsTable,
          Parcel,
          $$ParcelsTableFilterComposer,
          $$ParcelsTableOrderingComposer,
          $$ParcelsTableAnnotationComposer,
          $$ParcelsTableCreateCompanionBuilder,
          $$ParcelsTableUpdateCompanionBuilder,
          (Parcel, BaseReferences<_$AppDatabase, $ParcelsTable, Parcel>),
          Parcel,
          PrefetchHooks Function()
        > {
  $$ParcelsTableTableManager(_$AppDatabase db, $ParcelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParcelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParcelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParcelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> barcode = const Value.absent(),
                Value<String> warehouseId = const Value.absent(),
                Value<String> employeeId = const Value.absent(),
                Value<int?> weightGrams = const Value.absent(),
                Value<String?> rawWeight = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<DateTime> scannedAt = const Value.absent(),
                Value<String> receptionStatus = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<String> exportStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ParcelsCompanion(
                id: id,
                barcode: barcode,
                warehouseId: warehouseId,
                employeeId: employeeId,
                weightGrams: weightGrams,
                rawWeight: rawWeight,
                photoPath: photoPath,
                scannedAt: scannedAt,
                receptionStatus: receptionStatus,
                revision: revision,
                exportStatus: exportStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String barcode,
                required String warehouseId,
                required String employeeId,
                Value<int?> weightGrams = const Value.absent(),
                Value<String?> rawWeight = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                required DateTime scannedAt,
                Value<String> receptionStatus = const Value.absent(),
                Value<int> revision = const Value.absent(),
                Value<String> exportStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ParcelsCompanion.insert(
                id: id,
                barcode: barcode,
                warehouseId: warehouseId,
                employeeId: employeeId,
                weightGrams: weightGrams,
                rawWeight: rawWeight,
                photoPath: photoPath,
                scannedAt: scannedAt,
                receptionStatus: receptionStatus,
                revision: revision,
                exportStatus: exportStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ParcelsTable, Parcel>(table),
                  BaseReferences<_$AppDatabase, $ParcelsTable, Parcel>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ParcelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParcelsTable,
      Parcel,
      $$ParcelsTableFilterComposer,
      $$ParcelsTableOrderingComposer,
      $$ParcelsTableAnnotationComposer,
      $$ParcelsTableCreateCompanionBuilder,
      $$ParcelsTableUpdateCompanionBuilder,
      (Parcel, BaseReferences<_$AppDatabase, $ParcelsTable, Parcel>),
      Parcel,
      PrefetchHooks Function()
    >;
typedef $$ExportBatchesTableCreateCompanionBuilder =
    ExportBatchesCompanion Function({
      required String id,
      required String filename,
      required String warehouseId,
      required DateTime createdAt,
      required int parcelCount,
      required String checksum,
      Value<String> deliveryStatus,
      Value<int> rowid,
    });
typedef $$ExportBatchesTableUpdateCompanionBuilder =
    ExportBatchesCompanion Function({
      Value<String> id,
      Value<String> filename,
      Value<String> warehouseId,
      Value<DateTime> createdAt,
      Value<int> parcelCount,
      Value<String> checksum,
      Value<String> deliveryStatus,
      Value<int> rowid,
    });

class $$ExportBatchesTableFilterComposer
    extends Composer<_$AppDatabase, $ExportBatchesTable> {
  $$ExportBatchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warehouseId => $composableBuilder(
    column: $table.warehouseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parcelCount => $composableBuilder(
    column: $table.parcelCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deliveryStatus => $composableBuilder(
    column: $table.deliveryStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExportBatchesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExportBatchesTable> {
  $$ExportBatchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warehouseId => $composableBuilder(
    column: $table.warehouseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parcelCount => $composableBuilder(
    column: $table.parcelCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deliveryStatus => $composableBuilder(
    column: $table.deliveryStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExportBatchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExportBatchesTable> {
  $$ExportBatchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get filename =>
      $composableBuilder(column: $table.filename, builder: (column) => column);

  GeneratedColumn<String> get warehouseId => $composableBuilder(
    column: $table.warehouseId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get parcelCount => $composableBuilder(
    column: $table.parcelCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);

  GeneratedColumn<String> get deliveryStatus => $composableBuilder(
    column: $table.deliveryStatus,
    builder: (column) => column,
  );
}

class $$ExportBatchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExportBatchesTable,
          ExportBatche,
          $$ExportBatchesTableFilterComposer,
          $$ExportBatchesTableOrderingComposer,
          $$ExportBatchesTableAnnotationComposer,
          $$ExportBatchesTableCreateCompanionBuilder,
          $$ExportBatchesTableUpdateCompanionBuilder,
          (
            ExportBatche,
            BaseReferences<_$AppDatabase, $ExportBatchesTable, ExportBatche>,
          ),
          ExportBatche,
          PrefetchHooks Function()
        > {
  $$ExportBatchesTableTableManager(_$AppDatabase db, $ExportBatchesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExportBatchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExportBatchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExportBatchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> filename = const Value.absent(),
                Value<String> warehouseId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> parcelCount = const Value.absent(),
                Value<String> checksum = const Value.absent(),
                Value<String> deliveryStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExportBatchesCompanion(
                id: id,
                filename: filename,
                warehouseId: warehouseId,
                createdAt: createdAt,
                parcelCount: parcelCount,
                checksum: checksum,
                deliveryStatus: deliveryStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String filename,
                required String warehouseId,
                required DateTime createdAt,
                required int parcelCount,
                required String checksum,
                Value<String> deliveryStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExportBatchesCompanion.insert(
                id: id,
                filename: filename,
                warehouseId: warehouseId,
                createdAt: createdAt,
                parcelCount: parcelCount,
                checksum: checksum,
                deliveryStatus: deliveryStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExportBatchesTable, ExportBatche>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ExportBatchesTable,
                    ExportBatche
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExportBatchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExportBatchesTable,
      ExportBatche,
      $$ExportBatchesTableFilterComposer,
      $$ExportBatchesTableOrderingComposer,
      $$ExportBatchesTableAnnotationComposer,
      $$ExportBatchesTableCreateCompanionBuilder,
      $$ExportBatchesTableUpdateCompanionBuilder,
      (
        ExportBatche,
        BaseReferences<_$AppDatabase, $ExportBatchesTable, ExportBatche>,
      ),
      ExportBatche,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ParcelsTableTableManager get parcels =>
      $$ParcelsTableTableManager(_db, _db.parcels);
  $$ExportBatchesTableTableManager get exportBatches =>
      $$ExportBatchesTableTableManager(_db, _db.exportBatches);
}
