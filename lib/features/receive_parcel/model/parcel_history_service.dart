import 'dart:io';

import 'package:parcel_receiving/shared/database/app_database.dart';

class ParcelHistoryService {
  ParcelHistoryService(this._database);
  final AppDatabase _database;

  Future<void> deleteSelected(Set<String> ids) async {
    final selected = await _database.parcelsByIds(ids.toList());
    await _database.deleteParcels(ids.toList());
    final remaining = await _database.allParcels();
    final usedPhotos = remaining.map((parcel) => parcel.photoPath).toSet();
    for (final parcel in selected) {
      final path = parcel.photoPath;
      if (path == null || usedPhotos.contains(path)) continue;
      final file = File(path);
      if (await file.exists()) await file.delete();
    }
  }
}
