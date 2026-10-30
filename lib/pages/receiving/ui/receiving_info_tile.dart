import 'package:flutter/material.dart';

class ReceivingInfoTile extends StatelessWidget {
  const ReceivingInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(value),
    ),
  );
}
