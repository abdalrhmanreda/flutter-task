import 'package:flutter/material.dart';

import '../cache/cache_helper.dart';

class ThemeProviderHelper with ChangeNotifier {
  // Key used to store the theme mode in SharedPreferences
  static const String themeKey = 'themeMode';

  // Current theme mode (light or dark), initialized to light mode by default
  ThemeMode _themeMode = ThemeMode.light;

  // Getter for the current theme mode
  ThemeMode get themeMode => _themeMode;

  // Load the theme mode from SharedPreferences during initialization
  Future<void> loadTheme() async {
    // Retrieve the saved theme value from SharedPreferences
    final String? savedTheme = SharedPrefService().getString(themeKey);

    // Update the _themeMode based on the saved value, defaulting to light mode
    if (savedTheme != null) {
      _themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  // Toggle between light and dark mode and save the new state to SharedPreferences
  void toggleTheme() async {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    // Save the current theme mode to SharedPreferences
    await SharedPrefService().setString(
      themeKey,
      _themeMode == ThemeMode.dark ? 'dark' : 'light',
    );

    // Notify listeners about the theme change
    notifyListeners();
  }
}
