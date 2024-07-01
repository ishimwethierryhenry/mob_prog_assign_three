import 'package:flutter/material.dart';
import 'package:mob_prog_assign_three/screens/home_screen.dart';
import 'package:mob_prog_assign_three/services/theme_service.dart';

class MyApp extends StatelessWidget {
  final ThemeService themeService;

  MyApp({required this.themeService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeService.getTheme(),
      home: HomeScreen(themeService: themeService),
    );
  }
}
