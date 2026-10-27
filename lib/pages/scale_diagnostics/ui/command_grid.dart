import 'package:flutter/material.dart';

import '../../../shared/ble/model/co5_protocol.dart';
import '../../../shared/localization/app_localizations.dart';

class CommandGrid extends StatelessWidget {
  const CommandGrid({
    super.key,
    required this.enabled,
    required this.localizations,
    required this.onSend,
  });
  final bool enabled;
  final AppLocalizations localizations;
  final ValueChanged<Co5Command> onSend;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        localizations['commands'],
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const SizedBox(height: 12),
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.5,
        children: Co5Command.values
            .map(
              (command) => FilledButton.tonal(
                onPressed: enabled ? () => onSend(command) : null,
                child: Text(localizations[command.name]),
              ),
            )
            .toList(),
      ),
    ],
  );
}
