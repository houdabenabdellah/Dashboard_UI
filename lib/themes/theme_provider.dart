import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  //Default theme mode
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  //Toggle between light and dark mode
void toggleTheme (bool isDarkMode){
  _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light ;
  notifyListeners();
}

  // Light theme data
  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF5C5470),
      scaffoldBackgroundColor: const Color(0xFFFAF0E6),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFB9B4C7),
        foregroundColor: Colors.black,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(const Color(0xFF5C5470)),
        trackColor: WidgetStateProperty.all(const Color(0xFFB9B4C7)),
      ),
    );
  }

  // Dark theme data
  ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF352F44),
      scaffoldBackgroundColor: const Color(0xFF5C5470),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF352F44),
        foregroundColor: Colors.white,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(const Color(0xFFFAF0E6)),
        trackColor: WidgetStateProperty.all(const Color(0xFFB9B4C7)),
      ),
    );
  }


}