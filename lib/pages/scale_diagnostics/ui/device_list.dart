import 'package:flutter/material.dart';

import '../../../features/connect_scale/model/scale_diagnostics_state.dart';
import '../../../shared/localization/app_localizations.dart';
import '../../../shared/ui/ui.dart';
import 'device_card.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({
    super.key,
    required this.localizations,
    required this.state,
    required this.onConnect,
    required this.onDisconnect,
  });
  final AppLocalizations localizations;
  final ScaleDiagnosticsState state;
  final ValueChanged<String> onConnect;
  final VoidCallback onDisconnect;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SectionHeading(
        title: localizations['nearbyDevices'],
        trailing: Text(
          '${state.devices.length}',
          style: Theme.of(context).textTheme.labelLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
      ),
      const SizedBox(height: 4),
      Text(
        localizations['scanHint'],
        style: Theme.of(context).textTheme.bodyMedium
            ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
      const SizedBox(height: 12),
      if (state.devices.isEmpty) EmptyDevices(localizations: localizations),
      ...state.devices.map(
        (device) => DeviceCard(
          device: device,
          connected: state.isConnected && state.connectedDeviceId == device.id,
          connecting:
              state.isConnecting && state.connectedDeviceId == device.id,
          localizations: localizations,
          onConnect: () => onConnect(device.id),
          onDisconnect: onDisconnect,
        ),
      ),
    ],
  );
}
