// import 'dart:io';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:miswag_clone/core/controllers/auth/authentication_manager.dart';
// import 'package:miswag_clone/core/utils/helpers/launch_url_methods.dart';
// import 'package:miswag_clone/core/utils/helpers/spacing.dart';
// import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
// import 'package:miswag_clone/core/utils/themes/styles.dart';
// import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';
// import 'package:miswag_clone/screens/home/home_screen.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../../../screens/auth/auth_screen.dart';

// class DialogException implements Exception {
//   late final String statusDescription;
//   late final int statusCode;

//   final AuthenticationManager _authManager = Get.find();

//   DialogException(dynamic extractedData) {
//     statusDescription = extractedData['StatusDescription'];
//     statusCode = extractedData['StatusCode'];
//   }

//   Future<void> showDialog() async {
//     if (statusCode == 401) {
//       if (_authManager.isLogged.value) {
//         Get.snackbar(
//           'انتهت صلاحية الجلسة، يرجى تسجيل الدخول مرة اخرى',
//           '$statusDescription $statusCode',
//           snackPosition: SnackPosition.TOP,
//           duration: const Duration(seconds: 5),
//           borderRadius: 13,
//           backgroundColor: ColorsManager.primary,
//           colorText: ColorsManager.primaryText,
//         );
//         _authManager.logOut();
//         debugPrint('------**** loggedOut ');
//         Get.offAll(() => const AuthScreen());
//       }
//     } else if (statusCode == 409) {
//       AwesomeDialog(
//         context: Get.context!,
//         dialogType: DialogType.info,
//         headerAnimationLoop: false,
//         dismissOnBackKeyPress: false,
//         dismissOnTouchOutside: false,
//         animType: AnimType.scale,
//         title: "$statusDescription.",
//         titleTextStyle: TextStyles.font18BlackRegular,
//         padding:
//             const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15),
//         btnOk: SmallTextButton(
//           title: 'تحديث',
//           onPressed: () {
//             debugPrint('Redirect to app store for update');
//             // Add your redirection logic here
//             // redirect to app store for update and check if its ios or android
//             if (Platform.isAndroid) {
//               launchURL(
//                 'https://play.google.com/store/apps/details?id=iq.tabadul.tabadul_dealer&pcampaignid=web_share',
//                 mode: LaunchMode.externalApplication,
//               );
//             } else {
//               launchURL(
//                 'https://apps.apple.com/app/tabadul-agents-وكلاء-تبادل/id6736392248',
//                 mode: LaunchMode.externalApplication,
//               );
//             }
//           },
//           // color: ColorsManager.grayishGreen,
//         ),
//       ).show();
//     } else {
//       // Get.offAll(const HomeScreen());
//       // set delay 1 seconds
//       // await Future.delayed(const Duration(seconds: 1));
//       Get.snackbar(
//         icon: const Padding(
//           padding: EdgeInsets.only(right: 30),
//           child: Icon(
//             Icons.error_outline,
//             color: Colors.white,
//             size: 28,
//           ),
//         ),
//         statusDescription,
//         '$statusCode',
//         snackPosition: SnackPosition.TOP,
//         duration: const Duration(seconds: 5),
//         borderRadius: 13,
//         backgroundColor: Colors.red,
//         colorText: ColorsManager.white,
//       );
//     }

//     // else {
//     //   debugPrint(
//     //       '****** Error from DialogException: $statusDescription $statusCode ******');
//     //   // AwesomeDialog(
//     //   //   context: Get.context!,
//     //   //   dialogType: DialogType.warning,
//     //   //   headerAnimationLoop: false,
//     //   //   dismissOnBackKeyPress: false,
//     //   //   dismissOnTouchOutside: false,
//     //   //   animType: AnimType.scale,
//     //   //   // showCloseIcon: true,
//     //   //   // closeIcon: const Icon(Icons.close),
//     //   //   title: "$statusDescription.",
//     //   //   titleTextStyle: TextStyles.font18BlackRegular,
//     //   //   desc: '$statusCode',
//     //   //   // btnCancelOnPress: () {},
//     //   //   onDismissCallback: (type) =>
//     //   //       debugPrint('Dialog Dismiss from callback $type'),
//     //   //   // customHeader: SizedBox(),
//     //   //   btnOkOnPress: () => Get.offAll(() => const HomeScreen()),
//     //   //   padding:
//     //   //       const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15),
//     //   //   btnOk: SmallTextButton(
//     //   //     title: 'OK',
//     //   //     onPressed: () {
//     //   //       Get.back();
//     //   //     },
//     //   //   ),
//     //   // ).show();
//     //   Get.defaultDialog(
//     //     title: "",
//     //     // barrierDismissible: false,
//     //     backgroundColor: Colors.white,
//     //     contentPadding: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
//     //     content: Column(
//     //       children: [
//     //         const Icon(
//     //           Icons.error,
//     //           color: ColorsManager.secondary,
//     //           size: 35,
//     //         ),
//     //         verticalSpace(10),
//     //         // title
//     //         Text(
//     //           statusDescription,
//     //           style: const TextStyle(
//     //             fontSize: 25,
//     //             color: Colors.red,
//     //             fontFamily: "SFDisplay",
//     //             fontWeight: FontWeight.w900,
//     //           ),
//     //           textAlign: TextAlign.center,
//     //         ),
//     //         Text(
//     //           "$statusCode",
//     //           style: TextStyles.font18BlackRegular,
//     //           textAlign: TextAlign.center,
//     //         ),
//     //         // subtitle
//     //         // Text(
//     //         //   'سوف نقوم بإعلامك في حال قبول الطلب ومراحل الوصول',
//     //         //   style: TextStyles.font13GrayRegular,
//     //         //   textAlign: TextAlign.center,
//     //         // ),
//     //         verticalSpace(15),
//     //       ],
//     //     ),
//     //     textConfirm: "حسناً",
//     //     buttonColor: ColorsManager.primary,
//     //     // onWillPop: () {
//     //     //   Get.back();
//     //     //   return Future.value(true);
//     //     // },
//     //     onConfirm: () {
//     //       Navigator.pop(Get.context!);
//     //       // Get.offAll(() => const HomeScreen());
//     //     },
//     //   );
//     // }
//   }

// // class CustomHttpException implements Exception {
// //   final String message;

// //   CustomHttpException(this.message);

// //   @override
// //   String toString() {
// //     return message;
// //   }
// // }

//   // Future<void> showPopup(
//   //   BuildContext context,
//   //   void Function()? btnOkOnPress,
//   // ) {
//   //   final textColor = getTextColor(getDialogTypeFromString(statusIcon));

//   //   if (!isSuccess && statusMessage == 'not-authorized') {
//   //     return AwesomeDialog(
//   //       context: context,
//   //       dialogType: getDialogTypeFromString(statusIcon),
//   //       animType: AnimType.leftSlide,
//   //       headerAnimationLoop: false,
//   //       dismissOnBackKeyPress: false,
//   //       dismissOnTouchOutside: false,
//   //       btnCancelColor: Theme.of(context).hintColor,
//   //       btnOkColor: Theme.of(context).primaryColor,
//   //       title: message,
//   //       btnOkOnPress: () {
//   //         logout(context, () {
//   //           navigateToAuthScreen(context);
//   //         });
//   //       },
//   //       btnOkText: 'حسناً',
//   //       body: Padding(
//   //         padding: const EdgeInsets.all(10.0),
//   //         child: Text(
//   //           message,
//   //           style: TextStyle(
//   //             fontSize: 18,
//   //             color: textColor,
//   //             fontFamily: "SFDisplay",
//   //             fontWeight: FontWeight.w900,
//   //           ),
//   //           textAlign: TextAlign.center,
//   //         ),
//   //       ),
//   //     ).show();
//   //   } else {
//   //     return AwesomeDialog(
//   //       context: context,
//   //       dialogType: getDialogTypeFromString(statusIcon),
//   //       animType: AnimType.leftSlide,
//   //       headerAnimationLoop: false,
//   //       dismissOnBackKeyPress: false,
//   //       dismissOnTouchOutside: false,
//   //       btnCancelColor: Theme.of(context).hintColor,
//   //       btnOkColor: Theme.of(context).primaryColor,
//   //       title: message,
//   //       btnOkOnPress: btnOkOnPress ?? () {},
//   //       btnOkText: 'حسناً',
//   //       body: Padding(
//   //         padding: const EdgeInsets.all(10.0),
//   //         child: Text(
//   //           message,
//   //           style: TextStyle(
//   //             fontSize: 18,
//   //             color: textColor,
//   //             fontFamily: "SFDisplay",
//   //             fontWeight: FontWeight.w900,
//   //           ),
//   //           textAlign: TextAlign.center,
//   //         ),
//   //       ),
//   //     ).show();
//   //   }
//   // }

//   @override
//   String toString() {
//     return statusDescription;
//   }
// }
