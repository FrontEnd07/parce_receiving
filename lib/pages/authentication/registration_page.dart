import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/localization/app_localizations.dart';
import 'ui/auth_shell.dart';
import 'ui/auth_text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _repeat = TextEditingController();
  final _invite = TextEditingController();
  @override
  void dispose() {
    for (final controller in [_name, _phone, _password, _repeat, _invite]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return AuthShell(
      showBack: true,
      onBack: context.pop,
      child: Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l['createAccount'],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 28),
            AuthTextField(
              controller: _name,
              label: l['name'],
              icon: Icons.person_outline,
              validator: _required(l),
            ),
            const SizedBox(height: 12),
            AuthTextField(
              controller: _phone,
              label: l['phone'],
              icon: Icons.phone_outlined,
              validator: _required(l),
            ),
            const SizedBox(height: 12),
            AuthTextField(
              controller: _password,
              label: l['password'],
              icon: Icons.lock_outline,
              obscureText: true,
              validator: _required(l),
            ),
            const SizedBox(height: 12),
            AuthTextField(
              controller: _repeat,
              label: l['repeatPassword'],
              icon: Icons.lock_outline,
              obscureText: true,
              validator: (value) => value != _password.text
                  ? l['passwordMismatch']
                  : _required(l)(value),
            ),
            const SizedBox(height: 12),
            AuthTextField(
              controller: _invite,
              label: '${l['inviteCode']} (${l['optional']})',
              icon: Icons.warehouse_outlined,
              required: false,
            ),
            const SizedBox(height: 20),
            FilledButton(onPressed: _submit, child: Text(l['createAccount'])),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l['alreadyHaveAccount']),
                TextButton(onPressed: context.pop, child: Text(l['signIn'])),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? Function(String?) _required(AppLocalizations l) =>
      (value) =>
          value == null || value.trim().isEmpty ? l['requiredField'] : null;
  void _submit() {
    if (_form.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)['registrationUnavailable'],
          ),
        ),
      );
    }
  }
}
