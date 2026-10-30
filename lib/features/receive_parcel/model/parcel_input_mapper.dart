import 'package:parcel_receiving/entities/parcel/model/parcel_draft.dart';
import 'package:parcel_receiving/shared/database/app_database.dart';

ParcelDraft draftFromParcel(Parcel parcel) => ParcelDraft(
  barcode: parcel.barcode,
  weightGrams: parcel.weightGrams,
  rawWeight: parcel.rawWeight,
  photoPath: parcel.photoPath,
  scannedAt: parcel.scannedAt,
);

int? kilogramsToGrams(String value) {
  final kilograms = double.tryParse(value.replaceAll(',', '.'));
  return kilograms == null ? null : (kilograms * 1000).round();
}

String kilogramsText(int? grams) => grams == null ? '' : '${grams / 1000}';
