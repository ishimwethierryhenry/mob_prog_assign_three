// import 'dart:async';
// import 'package:battery_plus/battery_plus.dart';
// import 'package:flutter/material.dart';

// class BatteryService {
//   final Battery _battery = Battery();
//   late Timer _timer;

//   void initialize(BuildContext context) {
//     _timer = Timer.periodic(Duration(minutes: 1), (timer) async {
//       final batteryLevel = await _battery.batteryLevel;
//       final isCharging = await _battery.batteryState == BatteryState.charging;
//       if (isCharging && batteryLevel >= 90) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Battery is 90% or more and charging!')));
//       }
//     });
//   }

//   void dispose() {
//     _timer.cancel();
//   }
// }

import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryService {
  final Battery _battery = Battery();

  void initialize(BuildContext context) {
    _battery.onBatteryStateChanged.listen((BatteryState state) async {
      int batteryLevel = await _battery.batteryLevel;
      if (state == BatteryState.charging && batteryLevel >= 90) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Battery is charged to 90%')));
      }
    });
  }
}
