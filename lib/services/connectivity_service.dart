// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// class ConnectivityService {
//   final Connectivity _connectivity = Connectivity();
//   void initialize(BuildContext context) {
//     _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
//       String message;
//       if (result == ConnectivityResult.mobile ||
//           result == ConnectivityResult.wifi) {
//         message = 'Connected to the Internet';
//       } else {
//         message = 'No Internet Connection';
//       }
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(message)));
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  void initialize(BuildContext context) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      String message;
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        message = 'Internet Connected';
      } else {
        message = 'Internet Disconnected';
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    });
  }
}
