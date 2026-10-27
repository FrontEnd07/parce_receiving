import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeControllerProvider = NotifierProvider<ThemeController, ThemeMode>(
  ThemeController.new,
);

class ThemeController extends Notifier<ThemeMode> {
  static const _key = 'theme_mode';
  @override
  ThemeMode build() {
    _restore();
    return ThemeMode.system;
  }

  Future<void> _restore() async {
    final value = (await SharedPreferences.getInstance()).getString(_key);
    if (value != null) state = ThemeMode.values.byName(value);
  }

  Future<void> setTheme(ThemeMode value) async {
    state = value;
    await (await SharedPreferences.getInstance()).setString(_key, value.name);
  }
}
