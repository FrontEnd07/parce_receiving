import 'package:flutter/material.dart';

import 'package:parcel_receiving/shared/ble/lib/diagnostic_packet.dart';
import 'package:parcel_receiving/shared/localization/app_localizations.dart';
import 'package:parcel_receiving/shared/ui/ui.dart';

class LogSection extends StatelessWidget {
  const LogSection({
    super.key,
    required this.log,
    required this.localizations,
    required this.onClear,
  });
  final List<DiagnosticPacket> log;
  final AppLocalizations localizations;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SectionHeading(
        title: localizations['rawLog'],
        trailing: TextButton.icon(
          onPressed: log.isEmpty ? null : onClear,
          icon: const Icon(Icons.delete_outline),
          label: Text(localizations['clear']),
        ),
      ),
      const SizedBox(height: 4),
      if (log.isEmpty) const _EmptyLog(),
      ...log.reversed.map((packet) => _LogEntry(packet: packet)),
    ],
  );
}

class _EmptyLog extends StatelessWidget {
  const _EmptyLog();
  @override
  Widget build(BuildContext context) =>
      const EmptyStateCard(icon: Icons.receipt_long_outlined, title: '—');
}

class _LogEntry extends StatelessWidget {
  const _LogEntry({required this.packet});
  final DiagnosticPacket packet;
  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(top: 10),
    color: Theme.of(context).colorScheme.surfaceContainerLow,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            packet.receivedAt.toLocal().toIso8601String(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 8),
          SelectableText(
            'HEX  ${packet.hex}',
            style: const TextStyle(fontFamily: 'monospace'),
          ),
          const SizedBox(height: 4),
          SelectableText(
            'ASCII  ${packet.ascii}',
            style: const TextStyle(fontFamily: 'monospace'),
          ),
        ],
      ),
    ),
  );
}
