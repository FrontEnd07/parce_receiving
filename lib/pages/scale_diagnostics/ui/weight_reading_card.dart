import 'package:flutter/material.dart';

import '../../../shared/ble/model/co5_response.dart';
import '../../../shared/localization/app_localizations.dart';

class WeightReadingCard extends StatelessWidget {
  const WeightReadingCard({
    super.key,
    required this.response,
    required this.localizations,
  });
  final Co5Response? response;
  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final value = response;
    return Card(
      color: colors.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: value == null
            ? Text(
                localizations['noWeight'],
                style: TextStyle(color: colors.onTertiaryContainer),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations['currentWeight'],
                    style: Theme.of(context).textTheme.labelLarge
                        ?.copyWith(color: colors.onTertiaryContainer),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${value.kilograms!.toStringAsFixed(2)} kg',
                    style: Theme.of(context).textTheme.headlineMedium
                        ?.copyWith(color: colors.onTertiaryContainer),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${value.grams} g · ${localizations[value.type!.name]} · ${localizations['unconfirmed']}',
                    style: TextStyle(color: colors.onTertiaryContainer),
                  ),
                ],
              ),
      ),
    );
  }
}
