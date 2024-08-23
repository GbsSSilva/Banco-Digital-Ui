import 'package:flutter/material.dart';

class Tema extends ChangeNotifier {
  ThemeMode modoDeTema = ThemeMode.dark;

  bool get modoDark => modoDeTema == ThemeMode.dark;

  void alternarTema(bool isOn) {
    modoDeTema = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Themes {
  static final dark = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.grey)),
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.white54, size: 32),
  );

  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.highContrastLight(),
    iconTheme: const IconThemeData(size: 32),
  );
}
