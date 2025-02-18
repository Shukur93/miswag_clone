// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:miswag_clone/screens/home/home_screen.dart';
// import 'package:miswag_clone/screens/onboarding/onboarding_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   //  Future<void> initFirebaseNotifications() async {
//   //   await FirebaseApi().setUpFirebaseNotifications();
//   // }





//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void setState(fn) {
//     if (mounted) {
//       super.setState(fn);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // AuthenticationManager authenticationManager = Get.find();
//     return PopScope(
//       canPop: false,
//       child: Scaffold(
//         body: FutureBuilder(
//           future: initAuth(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text(snapshot.error.toString()),
//               );
//             } else {
//               // hasData
//               return Obx(
//                 () => authenticationManager.isLogged.value
//                     ? const HomeScreen()
//                     : const OnboardingScreen(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
