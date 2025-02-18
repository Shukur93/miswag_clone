// import 'package:connection_notifier/connection_notifier.dart';
// import 'package:flutter/material.dart';

// Future<void> checkInternetConnection(
//   Future<void> Function() method,
// ) async {
//   await ConnectionNotifierTools.initialize();
//   var onStatusChange = ConnectionNotifierTools.onStatusChange;

//   // Listen to the connection status
//   onStatusChange.listen((status) async {
//     if (status == ConnectionNotifierTools.isConnected && status) {
//       // Online
//       await method();

//       debugPrint('Online');
//     }
//   });
// }
