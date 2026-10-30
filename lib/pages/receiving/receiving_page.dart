import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../entities/parcel/model/parcel_draft.dart';
import '../../features/receive_parcel/model/parcel_history_service.dart';
import '../../features/receive_parcel/model/parcel_input_mapper.dart';
import '../../features/receive_parcel/model/parcel_saver.dart';
import '../../shared/database/app_database.dart';
import '../../shared/database/database_provider.dart';
import 'widgets/parcel_form.dart';
import 'widgets/receiving_app_bar.dart';
import 'widgets/receiving_history.dart';

class ReceivingPage extends ConsumerStatefulWidget {
  const ReceivingPage({super.key});
  @override
  ConsumerState<ReceivingPage> createState() => _ReceivingPageState();
}

class _ReceivingPageState extends ConsumerState<ReceivingPage> {
  final _barcode = TextEditingController();
  final _weight = TextEditingController();
  final _scroll = ScrollController();
  ParcelDraft _draft = const ParcelDraft(barcode: '');
  String? _editingId;
  bool _saving = false;
  @override
  void dispose() {
    _barcode.dispose();
    _weight.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const ReceivingAppBar(),
    body: ListView(
      controller: _scroll,
      padding: const EdgeInsets.all(20),
      children: [
        ParcelForm(
          barcode: _barcode,
          weight: _weight,
          draft: _draft,
          saving: _saving,
          editing: _editingId != null,
          onBarcodeChanged: (value) => _draft = _draft.copyWith(barcode: value),
          onWeightChanged: _changeWeight,
          onScan: _scan,
          onPhoto: _takePhoto,
          onSave: _save,
          onCancel: _reset,
        ),
        const SizedBox(height: 32),
        ReceivingHistory(onEdit: _edit, onDelete: _deleteSelected),
      ],
    ),
  );
  Future<void> _scan() async {
    final barcode = await context.push<String>('/scan');
    if (barcode != null) {
      _barcode.text = barcode;
      setState(
        () => _draft = _draft.copyWith(
          barcode: barcode,
          scannedAt: DateTime.now(),
        ),
      );
    }
  }

  Future<void> _takePhoto() async {
    final barcode = _barcode.text.trim();
    if (barcode.isEmpty) {
      _message('Сначала отсканируйте штрихкод.');
      return;
    }
    final path = await context.push<String>('/photo', extra: barcode);
    if (path != null && mounted) {
      setState(() => _draft = _draft.copyWith(photoPath: path));
    }
  }

  Future<void> _save() async {
    final draft = _draft.copyWith(
      barcode: _barcode.text.trim().toUpperCase(),
      scannedAt: _draft.scannedAt ?? DateTime.now(),
    );
    if (!draft.isComplete) {
      _message('Нужны штрихкод и фото.');
      return;
    }
    setState(() => _saving = true);
    await ParcelSaver(ref.read(appDatabaseProvider))
        .save(draft, parcelId: _editingId);
    if (!mounted) return;
    _reset();
    _message('Посылка сохранена.');
  }

  void _edit(Parcel parcel) {
    _barcode.text = parcel.barcode;
    _weight.text = kilogramsText(parcel.weightGrams);
    setState(() {
      _editingId = parcel.id;
      _draft = draftFromParcel(parcel);
    });
    _scroll.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> _deleteSelected(Set<String> ids) async {
    await ParcelHistoryService(ref.read(appDatabaseProvider))
        .deleteSelected(ids);
    if (_editingId != null && ids.contains(_editingId)) _reset();
    if (mounted) _message('Выбранные записи удалены.');
  }

  void _changeWeight(String value) => setState(
    () => _draft = _draft.copyWith(
      weightGrams: kilogramsToGrams(value),
      rawWeight: value.isEmpty ? null : '$value kg (manual)',
    ),
  );

  void _reset() {
    _barcode.clear();
    _weight.clear();
    setState(() {
      _draft = const ParcelDraft(barcode: '');
      _editingId = null;
      _saving = false;
    });
  }

  void _message(String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
