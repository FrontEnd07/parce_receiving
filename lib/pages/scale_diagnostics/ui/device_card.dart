import 'package:flutter/material.dart';

import '../../../entities/scale/model/scale_device.dart';
import '../../../shared/localization/app_localizations.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
    required this.device,
    required this.connected,
    required this.connecting,
    required this.localizations,
    required this.onConnect,
    required this.onDisconnect,
  });
  final ScaleDevice device;
  final bool connected;
  final bool connecting;
  final AppLocalizations localizations;
  final VoidCallback onConnect;
  final VoidCallback onDisconnect;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: connected ? colors.secondaryContainer : colors.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  connected ? Icons.bluetooth_connected : Icons.bluetooth,
                  color: connected
                      ? colors.onSecondaryContainer
                      : colors.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    device.name.isEmpty
                        ? '${localizations['unnamedDevice']} • ${device.id.substring(device.id.length - 4)}'
                        : device.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SignalIcon(rssi: device.rssi),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              device.id,
              style: Theme.of(context).textTheme.bodySmall
                  ?.copyWith(color: colors.onSurfaceVariant),
            ),
            const SizedBox(height: 14),
            Align(
              alignment: Alignment.centerRight,
              child: connecting
                  ? FilledButton.tonalIcon(
                      onPressed: null,
                      icon: const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      label: Text(localizations['connecting']),
                    )
                  : connected
                  ? OutlinedButton.icon(
                      onPressed: onDisconnect,
                      icon: const Icon(Icons.link_off),
                      label: Text(localizations['disconnect']),
                    )
                  : FilledButton.tonalIcon(
                      onPressed: onConnect,
                      icon: const Icon(Icons.link),
                      label: Text(localizations['connect']),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyDevices extends StatelessWidget {
  const EmptyDevices({super.key, required this.localizations});
  final AppLocalizations localizations;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Icon(
          Icons.bluetooth_searching,
          size: 36,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 12),
        Text(
          localizations['noDevices'],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 4),
        Text(
          localizations['noDevicesHint'],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    ),
  );
}

class SignalIcon extends StatelessWidget {
  const SignalIcon({super.key, required this.rssi});
  final int rssi;
  @override
  Widget build(BuildContext context) => Tooltip(
    message: 'RSSI $rssi dBm',
    child: Icon(
      rssi > -60
          ? Icons.signal_cellular_alt
          : rssi > -80
          ? Icons.network_cell
          : Icons.signal_cellular_alt_1_bar,
    ),
  );
}
