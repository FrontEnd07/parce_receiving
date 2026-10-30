import 'package:flutter/material.dart';

class AuthShell extends StatelessWidget {
  const AuthShell({
    super.key,
    required this.child,
    this.showBack = false,
    this.onBack,
  });
  final Widget child;
  final bool showBack;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (showBack)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: onBack,
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  Container(
                    width: 72,
                    height: 72,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.primaryContainer,
                    ),
                    child: Icon(
                      Icons.inventory_2_outlined,
                      size: 36,
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 24),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
