// import 'package:connection_notifier/connection_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/screens/home/home_screen.dart';
import 'package:miswag_clone/screens/onboarding/splash_screen.dart';

mixin AppLocale {
  static const String title = 'title';
  static const String thisIs = 'thisIs';

  // for Arabic
  static const Map<String, dynamic> ar = {
    title: 'التعريب',
    thisIs: 'هذا هو %a حزمة، الإصدار %a.',
  };

  // static const Map<String, dynamic> en = {
  //   title: 'Localization',
  //   thisIs: 'This is %a package, version %a.',
  // };
}

class MiswagApp extends StatefulWidget {
  const MiswagApp({
    super.key,
  });

  @override
  State<MiswagApp> createState() => _MiswagAppState();
}

class _MiswagAppState extends State<MiswagApp> {
  // get developer => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.rtl,
      // -------------------- H O M E -------------------- HERE
      home: const HomeScreen(),

      builder: EasyLoading.init(
        builder: (context, child) {
          // DevicePreview.appBuilder;
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

          // Add other text styles as needed
        ),
        // colorScheme: const ColorScheme(
        //   secondary: ColorsManager.primaryText,
        //   surface: Colors.white,
        //   // background: Color(0xFFEDEDED),
        //   error: Colors.red,
        //   onPrimary: ColorsManager
        //       .primaryText, // make text and icons dark gray by default
        //   onSecondary: Colors.white,
        //   onSurface: ColorsManager
        //       .primaryText, // make text and icons dark gray by default
        //   // onBackground: Colors.white,
        //   onError: ColorsManager.white,
        //   brightness: Brightness.light,
        //   primary: Colors.white,
        //   // onSurfaceVariant: Colors.amber
        // ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ColorsManager.primary,
          selectionColor: ColorsManager.lightestPrimary,
          selectionHandleColor: ColorsManager.primary,
        ),
      ),

      debugShowCheckedModeBanner: false,
    );

    // ConnectionNotifier(
    //   connectionNotificationOptions: const ConnectionNotificationOptions(
    //     connectedBackgroundColor: ColorsManager.primary,
    //     connectedText: 'تم الاتصال بالشبكة',
    //     disconnectedText: 'غير متصل بالشبكة، جاري المحاولة',
    //     connectedTextStyle: TextStyle(
    //       fontFamily: 'Vazirmatn',
    //       color: Colors.white,
    //       fontSize: 13,
    //     ),
    //     disconnectedTextStyle: TextStyle(
    //       fontFamily: 'Vazirmatn',
    //       color: Colors.white,
    //       fontSize: 13,
    //     ),
    //   ),
    //   child:

    // );
  }
}

// class NoInternetConnection extends StatelessWidget {
//   const NoInternetConnection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Spacer(),
//           verticalSpace(50),
//           const Icon(
//             Icons.wifi_off,
//             color: ColorsManager.lighterGray,
//             size: 200,
//           ),
//           verticalSpace(5),
//           const Text(
//             'يرجى التحقق \nمن اتصالك بالانترنت',
//             // style: TextStyles.font16GrayRegular,
//             textAlign: TextAlign.center,
//           ),
//           const Spacer(),
//           verticalSpace(35)
//         ],
//       )),
//     );
//   }
// }
