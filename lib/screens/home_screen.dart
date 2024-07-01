import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mob_prog_assign_three/services/connectivity_service.dart';
import 'package:mob_prog_assign_three/services/battery_service.dart';
import 'package:mob_prog_assign_three/services/theme_service.dart';

class HomeScreen extends StatelessWidget {
  final ConnectivityService _connectivityService = ConnectivityService();
  final BatteryService _batteryService = BatteryService();
  final ThemeService _themeService;

  HomeScreen({required ThemeService themeService})
      : _themeService = themeService;

  @override
  Widget build(BuildContext context) {
    _connectivityService.initialize(context);
    _batteryService.initialize(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () async {
              await _themeService.toggleThemeMode();
              // Trigger a rebuild to apply the new theme
              (context as Element).reassemble();
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('/sign_in');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Mobile Programming Assignment'),
      ),
    );
  }
}
