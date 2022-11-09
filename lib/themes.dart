// Theme file including light and dark versions

import 'package:flutter/material.dart';

// Instantiate Light Mode
final ThemeData lightTheme = _lightTheme();

//Define Base theme for app
ThemeData _lightTheme() {
// We'll just overwrite whatever's already there using ThemeData.light()
  final ThemeData base = ThemeData.light();

  // Make changes to light() theme
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: const Color.fromARGB(255, 255, 153, 51),
      onPrimary: Colors.white,
      secondary: const Color.fromARGB(255, 223, 27, 12),
      onSecondary: Colors.white,
      background: const Color.fromARGB(255, 228, 243, 228),
      onBackground: Colors.black,
    ),
  );
}

// Instantiate Dark mode
final ThemeData darkTheme = _darkTheme();

//Define Base theme for app
ThemeData _darkTheme() {
// We'll just overwrite whatever's already there using ThemeData.light()
  final ThemeData base = ThemeData.dark();

  // Make changes to light() theme
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: const Color.fromARGB(255, 255, 153, 51),
      onPrimary: Colors.white,
      secondary: const Color.fromARGB(255, 223, 27, 12),
      onSecondary: Colors.white,
      background: const Color.fromARGB(255, 228, 243, 228),
      onBackground: Colors.black,
    ),
  );
}
