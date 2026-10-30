import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReceivingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReceivingAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
    title: const Text('Приёмка посылки'),
    actions: [
      IconButton(
        tooltip: 'Bluetooth-весы',
        onPressed: () => context.push('/diagnostics'),
        icon: const Icon(Icons.bluetooth_searching),
      ),
    ],
  );
}
