import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/database/app_database.dart';
import '../../../shared/database/database_provider.dart';
import '../../../shared/ui/empty_state_card.dart';
import '../../../shared/ui/section_heading.dart';

class ReceivingHistory extends ConsumerStatefulWidget {
  const ReceivingHistory({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });
  final ValueChanged<Parcel> onEdit;
  final Future<void> Function(Set<String>) onDelete;

  @override
  ConsumerState<ReceivingHistory> createState() => _ReceivingHistoryState();
}

class _ReceivingHistoryState extends ConsumerState<ReceivingHistory> {
  final _selected = <String>{};

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Parcel>>(
    stream: ref.read(appDatabaseProvider).watchParcels(),
    builder: (context, snapshot) {
      final parcels = snapshot.data ?? const <Parcel>[];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeading(
            title: 'История приёмки',
            trailing: _selected.isEmpty
                ? null
                : IconButton.filledTonal(
                    tooltip: 'Удалить выбранные',
                    onPressed: _confirmDelete,
                    icon: const Icon(Icons.delete_outline),
                  ),
          ),
          const SizedBox(height: 12),
          if (parcels.isEmpty)
            const EmptyStateCard(
              icon: Icons.inventory_2_outlined,
              title: 'Принятых посылок пока нет',
            )
          else
            ...parcels.map(_item),
        ],
      );
    },
  );

  Widget _item(Parcel parcel) => Card(
    child: ListTile(
      leading: Checkbox(
        value: _selected.contains(parcel.id),
        onChanged: (_) => _toggle(parcel.id),
      ),
      title: Text(parcel.barcode),
      subtitle: Text(
        '${_weight(parcel.weightGrams)} • ${_date(parcel.scannedAt)}',
      ),
      trailing: IconButton(
        tooltip: 'Редактировать',
        onPressed: () => widget.onEdit(parcel),
        icon: const Icon(Icons.edit_outlined),
      ),
      onLongPress: () => _toggle(parcel.id),
    ),
  );

  void _toggle(String id) => setState(() {
    _selected.contains(id) ? _selected.remove(id) : _selected.add(id);
  });

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить выбранные посылки?'),
        content: Text('Будет удалено записей: ${_selected.length}.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await widget.onDelete(Set.of(_selected));
    if (mounted) setState(_selected.clear);
  }

  String _weight(int? grams) =>
      grams == null ? 'Вес не указан' : '${grams / 1000} кг';

  String _date(DateTime value) {
    String two(int number) => number.toString().padLeft(2, '0');
    return '${two(value.day)}.${two(value.month)}.${value.year} '
        '${two(value.hour)}:${two(value.minute)}';
  }
}
