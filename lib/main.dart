import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miswag_clone/miswag_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // only portrait orientation
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MiswagApp());
}

