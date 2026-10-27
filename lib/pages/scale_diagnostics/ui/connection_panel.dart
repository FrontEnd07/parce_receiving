import 'package:flutter/material.dart';

import '../../../features/connect_scale/model/scale_diagnostics_state.dart';
import '../../../shared/localization/app_localizations.dart';

class ConnectionPanel extends StatelessWidget {
  const ConnectionPanel({
    super.key,
    required this.localizations,
    required this.state,
    required this.onEnableBluetooth,
  });
  final AppLocalizations localizations;
  final ScaleDiagnosticsState state;
  final Future<void> Function() onEnableBluetooth;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final connected = state.isConnected;
    final background = connected
        ? colors.primaryContainer
        : colors.surfaceContainerHighest;
    final foreground = connected
        ? colors.onPrimaryContainer
        : colors.onSurfaceVariant;
    return Card(
      color: background,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.surface.withValues(alpha: .56),
                  ),
                  child: Icon(
                    connected
                        ? Icons.bluetooth_connected
                        : Icons.bluetooth_searching,
                    color: foreground,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations['connection'],
                        style: Theme.of(context).textTheme.labelLarge
                            ?.copyWith(color: foreground),
                      ),
                      Text(
                        connected
                            ? localizations['connected']
                            : localizations['readyToConnect'],
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(color: foreground),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              localizations['hardwareNote'],
              style: TextStyle(color: foreground),
            ),
            if (state.error != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  state.error!,
                  style: TextStyle(color: colors.error),
                ),
              ),
            if (state.error == 'Bluetooth disabled (code 1)')
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: FilledButton.icon(
                  onPressed: onEnableBluetooth,
                  icon: const Icon(Icons.bluetooth),
                  label: Text(localizations['enableBluetooth']),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
