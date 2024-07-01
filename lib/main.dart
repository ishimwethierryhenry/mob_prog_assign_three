import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/connectivity_service.dart';
import 'services/battery_service.dart';
import 'services/theme_service.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final ThemeService _themeService = ThemeService();
  await _themeService.initialize();

  runApp(MyApp(themeService: _themeService));
}

class MyApp extends StatelessWidget {
  final ThemeService _themeService;

  MyApp({required ThemeService themeService}) : _themeService = themeService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Programming Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeService.getThemeMode(),
      home: SignInScreen(),
      routes: {
        '/home': (context) => HomeScreen(themeService: _themeService),
        '/sign_in': (context) => SignInScreen(),
        '/sign_up': (context) => SignUpScreen(),
      },
    );
  }
}
