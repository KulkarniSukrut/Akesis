/// Theme Provider - Manages light/dark theme state

library presentation.theme;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/design/design.dart';

/// Theme Mode Provider - using NotifierProvider (Riverpod 3.x style)
final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(() {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends Notifier<ThemeMode> {
  static const _key = 'theme_mode';

  @override
  ThemeMode build() {
    _load();
    return ThemeMode.system;
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key);
    if (stored != null) {
      state = ThemeMode.values.byName(stored);
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.name);
  }

  void toggleTheme() {
    setThemeMode(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }
}

/// Theme Data Provider - Provides the appropriate ThemeData based on mode
final themeDataProvider = Provider<ThemeData>((ref) {
  final mode = ref.watch(themeModeProvider);
  // We can't access context here, so we'll use a different approach
  // The actual theme resolution happens in the app widget
  return lightTheme; // Default, will be overridden by MaterialApp.router
});

/// Theme Brightness Provider - Computes brightness from theme mode and system
final themeBrightnessProvider = Provider<Brightness>((ref) {
  final mode = ref.watch(themeModeProvider);
  // This will be resolved in the app widget using MediaQuery
  if (mode == ThemeMode.dark) return Brightness.dark;
  if (mode == ThemeMode.light) return Brightness.light;
  // For system, we'll default to light and let the app widget handle it
  return Brightness.light;
});