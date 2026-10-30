import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
    this.obscureText = false,
    this.required = true,
    this.validator,
  });
  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final bool obscureText;
  final bool required;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    obscureText: obscureText,
    keyboardType:
        label.toLowerCase().contains('phone') ||
            label.contains('телефон') ||
            label.contains('电话')
        ? TextInputType.phone
        : TextInputType.text,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: icon == null ? null : Icon(icon),
    ),
    validator: validator,
  );
}
