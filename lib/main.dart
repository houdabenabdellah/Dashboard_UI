
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_dashboard/screens/main_screen.dart';
import 'package:ui_dashboard/themes/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dashboard UI",
      theme: themeProvider.darkTheme,
      darkTheme: themeProvider.lightTheme,
      themeMode: themeProvider.themeMode,
      home: const MainScreen(),
    );
  }
}
