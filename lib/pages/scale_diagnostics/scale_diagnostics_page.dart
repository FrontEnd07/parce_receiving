import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/connect_scale/model/scale_diagnostics_controller.dart';
import '../../shared/localization/app_localizations.dart';
import 'ui/command_grid.dart';
import 'ui/connection_panel.dart';
import 'ui/device_list.dart';
import 'ui/log_section.dart';
import 'ui/weight_reading_card.dart';

class ScaleDiagnosticsPage extends ConsumerWidget {
  const ScaleDiagnosticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final state = ref.watch(scaleDiagnosticsProvider);
    final controller = ref.read(scaleDiagnosticsProvider.notifier);
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parcel Receiving'),
        actions: [
          IconButton(
            onPressed: () => context.push('/receiving'),
            icon: const Icon(Icons.inventory_2_outlined),
            tooltip: l['receiving'],
          ),
          IconButton(
            onPressed: () => context.push('/export'),
            icon: const Icon(Icons.archive_outlined),
            tooltip: l['export'],
          ),
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings_outlined),
            tooltip: l['settings'],
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
          children: [
            Text(
              l['diagnostics'],
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            Text(
              l['diagnosticsSubtitle'],
              style: Theme.of(context).textTheme.bodyLarge
                  ?.copyWith(color: colors.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            ConnectionPanel(
              localizations: l,
              state: state,
              onEnableBluetooth: controller.openBluetoothSettings,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: state.isScanning
                  ? controller.stopScan
                  : controller.scan,
              icon: Icon(
                state.isScanning
                    ? Icons.stop_circle_outlined
                    : Icons.radar_outlined,
              ),
              label: Text(state.isScanning ? l['scanning'] : l['scan']),
            ),
            const SizedBox(height: 28),
            DeviceList(
              localizations: l,
              state: state,
              onConnect: controller.connect,
              onDisconnect: controller.disconnect,
            ),
            const SizedBox(height: 16),
            WeightReadingCard(response: state.lastWeight, localizations: l),
            const SizedBox(height: 28),
            CommandGrid(
              enabled: state.isConnected,
              localizations: l,
              onSend: controller.send,
            ),
            const SizedBox(height: 28),
            LogSection(
              log: state.log,
              localizations: l,
              onClear: controller.clearLog,
            ),
          ],
        ),
      ),
    );
  }
}
