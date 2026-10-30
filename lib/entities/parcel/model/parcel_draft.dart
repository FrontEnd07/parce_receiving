class ParcelDraft {
  const ParcelDraft({
    required this.barcode,
    this.weightGrams,
    this.rawWeight,
    this.photoPath,
    this.scannedAt,
  });
  final String barcode;
  final int? weightGrams;
  final String? rawWeight;
  final String? photoPath;
  final DateTime? scannedAt;
  bool get isComplete => barcode.isNotEmpty && photoPath != null;
  ParcelDraft copyWith({
    String? barcode,
    int? weightGrams,
    String? rawWeight,
    String? photoPath,
    DateTime? scannedAt,
    bool clearPhoto = false,
  }) => ParcelDraft(
    barcode: barcode ?? this.barcode,
    weightGrams: weightGrams ?? this.weightGrams,
    rawWeight: rawWeight ?? this.rawWeight,
    photoPath: clearPhoto ? null : photoPath ?? this.photoPath,
    scannedAt: scannedAt ?? this.scannedAt,
  );
}
