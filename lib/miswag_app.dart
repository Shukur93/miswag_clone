import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/screens/home/home_screen.dart';

class MiswagApp extends StatefulWidget {
  const MiswagApp({
    super.key,
  });

  @override
  State<MiswagApp> createState() => _MiswagAppState();
}

class _MiswagAppState extends State<MiswagApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.rtl,
      home: const HomeScreen(),
      builder: EasyLoading.init(
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQueryData.copyWith(textScaler: TextScaler.noScaling),
            child: child!,
          );
        },
      ),
      theme: ThemeData(
        primaryColor: ColorsManager.primary,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Vazirmatn',
        useMaterial3: true,
        primaryColorDark: const Color(0xFF171719),
        dialogBackgroundColor: const Color(0xFFE7E7E7),
        secondaryHeaderColor: const Color(0xFFEDEDED),
        hintColor: const Color(0xFFA6A6A6),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: ColorsManager.primaryText),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ColorsManager.primary,
          selectionColor: ColorsManager.lightestPrimary,
          selectionHandleColor: ColorsManager.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
