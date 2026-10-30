import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../features/export_archive/model/export_service.dart';
import '../../shared/database/database_provider.dart';

class ExportPage extends ConsumerStatefulWidget {
  const ExportPage({super.key});
  @override
  ConsumerState<ExportPage> createState() => _ExportPageState();
}

class _ExportPageState extends ConsumerState<ExportPage> {
  bool _working = false;
  ExportResult? _result;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('ZIP-экспорт')),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Экспорт посылок',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 12),
          const Text(
            'Создаётся ZIP с Excel-таблицей parcels.xlsx, manifest.json и локальными фотографиями. Удаление архива не удаляет записи.',
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _working ? null : _create,
            icon: _working
                ? const CircularProgressIndicator()
                : const Icon(Icons.archive_outlined),
            label: const Text('Создать ZIP'),
          ),
          if (_result != null) ...[
            const SizedBox(height: 24),
            SelectableText(
              'Файл: ${_result!.filename}\nПосылок: ${_result!.count}',
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: _share,
              icon: const Icon(Icons.share_outlined),
              label: const Text('Поделиться'),
            ),
            TextButton.icon(
              onPressed: _deleteCurrent,
              icon: const Icon(Icons.delete_outline),
              label: const Text('Удалить этот ZIP с телефона'),
            ),
          ],
          const Spacer(),
          OutlinedButton.icon(
            onPressed: _deleteAll,
            icon: const Icon(Icons.cleaning_services_outlined),
            label: const Text('Удалить все локальные ZIP-экспорты'),
          ),
        ],
      ),
    ),
  );
  Future<void> _create() async {
    setState(() => _working = true);
    try {
      final result = await ExportService(ref.read(appDatabaseProvider))
          .createCurrentExport();
      if (mounted) {
        setState(() => _result = result);
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      }
    } finally {
      if (mounted) {
        setState(() => _working = false);
      }
    }
  }

  Future<void> _share() => SharePlus.instance.share(
    ShareParams(files: [XFile(_result!.path)], text: _result!.filename),
  );

  Future<void> _deleteCurrent() async {
    await ExportService(ref.read(appDatabaseProvider))
        .deleteExport(_result!.path);
    if (mounted) setState(() => _result = null);
  }

  Future<void> _deleteAll() async {
    final count = await ExportService(ref.read(appDatabaseProvider))
        .deleteLocalExports();
    if (mounted) {
      setState(() => _result = null);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Удалено архивов: $count')));
    }
  }
}
