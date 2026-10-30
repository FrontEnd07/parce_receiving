import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/localization/app_localizations.dart';
import 'ui/auth_shell.dart';
import 'ui/auth_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  bool _hidePassword = true;
  @override
  void dispose() {
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return AuthShell(
      child: Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Parcel Receiving',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              l['authIntro'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            AuthTextField(
              controller: _phone,
              label: l['phone'],
              icon: Icons.phone_outlined,
              validator: _required(l),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _password,
              obscureText: _hidePassword,
              decoration: InputDecoration(
                labelText: l['password'],
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () =>
                      setState(() => _hidePassword = !_hidePassword),
                  icon: Icon(
                    _hidePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
              validator: _required(l),
            ),
            const SizedBox(height: 20),
            FilledButton(onPressed: _showBackendNote, child: Text(l['signIn'])),
            const SizedBox(height: 12),
            Text(
              l['authServerNote'],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l['noAccount']),
                TextButton(
                  onPressed: () => context.push('/register'),
                  child: Text(l['createAccount']),
                ),
              ],
            ),
            OutlinedButton.icon(
              onPressed: () => context.go('/diagnostics'),
              icon: const Icon(Icons.bluetooth_searching),
              label: Text(l['openDiagnostics']),
            ),
          ],
        ),
      ),
    );
  }

  String? Function(String?) _required(AppLocalizations l) =>
      (value) =>
          value == null || value.trim().isEmpty ? l['requiredField'] : null;
  void _showBackendNote() {
    if (_form.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)['authServerNote'])),
      );
    }
  }
}
