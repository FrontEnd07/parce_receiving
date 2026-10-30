import 'package:flutter/material.dart';

import '../../../entities/parcel/model/parcel_draft.dart';
import 'parcel_photo_tile.dart';

class ParcelForm extends StatelessWidget {
  const ParcelForm({
    super.key,
    required this.barcode,
    required this.weight,
    required this.draft,
    required this.saving,
    required this.editing,
    required this.onBarcodeChanged,
    required this.onWeightChanged,
    required this.onScan,
    required this.onPhoto,
    required this.onSave,
    required this.onCancel,
  });
  final TextEditingController barcode;
  final TextEditingController weight;
  final ParcelDraft draft;
  final bool saving;
  final bool editing;
  final ValueChanged<String> onBarcodeChanged;
  final ValueChanged<String> onWeightChanged;
  final VoidCallback onScan;
  final VoidCallback onPhoto;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        editing ? 'Редактирование посылки' : 'Новая посылка',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      const SizedBox(height: 20),
      TextField(
        controller: barcode,
        onChanged: onBarcodeChanged,
        decoration: InputDecoration(
          labelText: 'Штрихкод',
          suffixIcon: IconButton(
            onPressed: onScan,
            icon: const Icon(Icons.qr_code_scanner),
          ),
        ),
      ),
      const SizedBox(height: 16),
      TextField(
        controller: weight,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: onWeightChanged,
        decoration: const InputDecoration(
          labelText: 'Вес, кг',
          helperText: 'Можно указать вручную, если весы не подключены.',
          prefixIcon: Icon(Icons.scale_outlined),
        ),
      ),
      const SizedBox(height: 12),
      ParcelPhotoTile(path: draft.photoPath, onPressed: onPhoto),
      const SizedBox(height: 20),
      FilledButton.icon(
        onPressed: saving ? null : onSave,
        icon: saving
            ? const CircularProgressIndicator()
            : const Icon(Icons.save_outlined),
        label: Text(editing ? 'Сохранить изменения' : 'Сохранить локально'),
      ),
      if (editing)
        TextButton(
          onPressed: onCancel,
          child: const Text('Отменить изменения'),
        ),
    ],
  );
}
