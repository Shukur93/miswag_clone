// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter/services.dart';
// import 'package:phone_numbers_parser/phone_numbers_parser.dart';
// import 'package:miswag_clone/core/controllers/auth/login_controller.dart';
// import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
// import 'package:miswag_clone/core/controllers/countdown_controller.dart';
// import 'package:miswag_clone/core/controllers/order/order_controller.dart';
// import 'package:miswag_clone/core/models/order/add_order/add_order_request_model.dart';
// import 'package:miswag_clone/core/models/order/get_items/get_items_response_model.dart';
// import 'package:miswag_clone/core/utils/helpers/spacing.dart';
// import 'package:miswag_clone/core/utils/themes/styles.dart';
// import 'package:miswag_clone/core/utils/widgets/app_bars.dart';
// import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';
// import 'package:miswag_clone/core/utils/widgets/app_text_form_field.dart';
// import 'package:miswag_clone/core/utils/widgets/progress_bar_stages.dart';
// import 'package:miswag_clone/core/utils/widgets/terms_and_conditions.dart';
// import 'package:miswag_clone/screens/home/home_screen.dart';

// enum AuthFormType {
//   login,
//   register,
//   otpVerification,
//   forgetPassword,
//   otpVerifyForgetPassword,
// }

// class AuthScreen extends StatefulWidget {
//   final AuthFormType? formType;
//   //  - -
//   // Where you come from? and where you go?
//   // is gonna make a purchase
//   final ItemsData? item;
//   final bool isGonnaPurchase;
//   final double? singleItemPrice;
//   final bool isFromCart;
//   // - -
//   const AuthScreen({
//     super.key,
//     this.formType,
//     this.item,
//     this.isGonnaPurchase = false,
//     this.singleItemPrice,
//     this.isFromCart = false,
//   });

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   bool isObscureText = true;
//   final CartController cartController = Get.find();

//   final CountdownController countdownController =
//       Get.put(CountdownController());

//   @override
//   void initState() {
//     super.initState();
//   }

//   // INIT #GET* CONTROLLER
//   final LoginController _loginViewModel = Get.put(LoginController());
//   final OrderController orderController = Get.put(OrderController());
//   final GlobalKey<FormState> formKey = GlobalKey();
//   final GlobalKey<FormState> _changePasswordFormKey = GlobalKey();

//   final TextEditingController phoneNoController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController newPasswordController = TextEditingController();
//   TextEditingController confirmNewPasswordController = TextEditingController();
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController otpController = TextEditingController();
//   TextEditingController fpOtpController = TextEditingController();

//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _confirmNewPasswordController =
//       TextEditingController();

//   late AuthFormType _formType = widget.formType ?? AuthFormType.login;
//   int userId = 0;

//   bool _isObscureNewPassword = true;
//   bool _isObscureConfirmNewPassword = true;

//   Future<void> loginHandler() async {
//     await _loginViewModel.loginUser(
//       phoneNo: phoneNoController.text,
//       password: passwordController.text,
//       deviceId: '123',
//       deviceToken: '123',
//     );

//     if (_loginViewModel.isLoggedInSucceeded) {
//       if (widget.isGonnaPurchase) {
//         // 2 Directions comes from
//         // 1. from cart
//         if (widget.isFromCart) {
//           List<AddOrderRequestModel> orderItems = cartController.cartItems
//               .map(
//                 (cartItem) => AddOrderRequestModel(
//                   itemId: cartItem.cartItem.id ?? 0,
//                   quantity: cartItem.quantity,
//                 ),
//               )
//               .toList();

//           // Call addOrder function
//           await orderController.addOrder(items: orderItems);
//         } else {
//           // 2. from item detail
//           final singleOrderItem = AddOrderRequestModel(
//             itemId: widget.item?.id ?? 0,
//             quantity: cartController.selectedQuantity.value,
//           );
//           await orderController.addOrder(singleItem: singleOrderItem);
//         }
//       } else {
//         Get.offAll(() => const HomeScreen());
//       }
//     }
//   }

//   Future<void> registerHandler() async {
//     await _loginViewModel.registerUser(
//       phoneNo: phoneNoController.text,
//       password: passwordController.text,
//       passwordConfirmation: passwordController.text,
//       firstName: firstNameController.text,
//       lastName: lastNameController.text,
//       // governorate: _dropDownGovernorateController,
//       email: emailController.text,
//     );
//   }

//   bool isNewPasswordMatched() {
//     return _newPasswordController.text == _confirmNewPasswordController.text;
//   }

//   bool isActionBtnEnabled() {
//     if ((_changePasswordFormKey.currentState?.validate() ?? false) &&
//         isNewPasswordMatched()) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   @override
//   void setState(fn) {
//     if (mounted) {
//       super.setState(fn);
//     }
//   }

// //   do a switch case for status type

//   @override
//   void dispose() {
//     phoneNoController.dispose();
//     passwordController.dispose();
//     newPasswordController.dispose();
//     confirmNewPasswordController.dispose();
//     firstNameController.dispose();
//     lastNameController.dispose();
//     emailController.dispose();
//     otpController.dispose();
//     fpOtpController.dispose();
//     _newPasswordController.dispose();
//     _confirmNewPasswordController.dispose();

//     // Get.delete<LoginController>();
//     super.dispose();
//   }

// // ! ================================= build ======
//   @override
//   Widget build(BuildContext context) {
//     // print('FCM TOKEN FROM LOGIN SCREEN: ${FCMTokenManager.fCMToken}');
//     // set default values
//     // phoneNoController.text = '01111111111';
//     // passwordController.text = '12345678';
//     // firstNameController.text = 'test';
//     // lastNameController.text = 'test';
//     // emailController = TextEditingController(text: 'test@gmail.com');
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: SecondaryAppBar(),
//       // floatingActionButton: FloatingActionButton(onPressed: () {
//       //   registerHandler();
//       // }),
//       body: GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: Padding(
//           padding:
//               EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//           child: SingleChildScrollView(
//             // reverse: true,
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 verticalSpace(15),
//                 Container(
//                   height: 50,
//                   width: double.infinity,
//                   color: const Color(0xFFEFEFEF),
//                   child: const ProgressBarStageOne(),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     right: 30,
//                     left: 30,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       // verticalSpace(36),
//                       if (_formType == AuthFormType.login)
//                         loginForm()
//                       else if (_formType == AuthFormType.register)
//                         registerForm()
//                       else if (_formType == AuthFormType.otpVerification)
//                         otpForm()
//                       else if (_formType == AuthFormType.forgetPassword)
//                         forgetPasswordForm()
//                       else if (_formType ==
//                           AuthFormType.otpVerifyForgetPassword)
//                         otpVerifyForgetPasswordForm(),

//                       const TermsAndConditionsText(),
//                       verticalSpace(60),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Form loginForm() {
//     return Form(
//       key: formKey,
//       // autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           verticalSpace(35),
//           Text(
//             'تسجيل الدخول',
//             style: TextStyles.font20PrimaryTextBold,
//             textAlign: TextAlign.start,
//           ),
//           verticalSpace(7),
//           const Text(
//               'يرجى تسجيل الدخول أو إنشاء حساب جديد لأتمام عملية الشراء'),
//           verticalSpace(50),
//           const Text('رقم الهاتف'),
//           verticalSpace(10),
//           phoneNumberInput(),
//           verticalSpace(25),
//           const Text('كلمة المرور'),
//           verticalSpace(10),
//           passwordInput(),
//           // -----!!!!!!----- Forget Password Button -----!!!!!!-----
//           TextButton(
//             onPressed: () =>
//                 setState(() => _formType = AuthFormType.forgetPassword),
//             style: ButtonStyle(
//               padding: WidgetStateProperty.all(const EdgeInsets.only(right: 5)),
//             ),
//             child: Text(
//               'نسيت كلمة المرور؟',
//               style: TextStyles.font13PrimaryLight,
//             ),
//           ),
//           verticalSpace(40),
//           AppTextButton(
//             buttonText: "دخول",
//             textStyle: TextStyles.font16WhiteBold,
//             onPressed: () async {
//               if (formKey.currentState?.validate() ?? false) {
//                 await loginHandler();
//                 // 2 directions
//                 // |
//                 // |
//               }
//             },
//           ),
//           verticalSpace(16),
//           goToRegisterForm(),
//           verticalSpace(20),
//         ],
//       ),
//     );
//   }

//   Form forgetPasswordForm() {
//     return Form(
//       key: formKey,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           verticalSpace(35),
//           phoneNumberInput(),
//           verticalSpace(40),
//           AppTextButton(
//             buttonText: "ارسال",
//             textStyle: TextStyles.font16WhiteBold,
//             onPressed: () async {
//               await fp1Handler();
//             },
//           ),
//           verticalSpace(20),
//           goToRegisterForm(),
//           goToLoginForm(),
//           verticalSpace(20),
//         ],
//       ),
//     );
//   }

// // ! Forget Password #1 ========================================
//   Future<void> fp1Handler() async {
//     if (formKey.currentState?.validate() ?? false) {
//       await _loginViewModel.fp1Initial(phoneNo: phoneNoController.text);
//       // countdownController.startCountdown120();
//     }
//     if (_loginViewModel.isOnForgotPasswordOtpSent) {
//       setState(() => _formType = AuthFormType.otpVerifyForgetPassword);
//     }
//   }

// // ! Forget Password #2 and #3 ========================================
//   Future<void> fp1And2Handler() async {
//     if (_changePasswordFormKey.currentState?.validate() ?? false) {
//       await _loginViewModel.fp2And3(
//         // ! #2
//         phoneNo: phoneNoController.text,
//         otpCode: fpOtpController.text,
//         // ! #3
//         newPassword: _newPasswordController.text,
//         passwordConfirmation: _confirmNewPasswordController.text,
//       );
//     }
//     if (_loginViewModel.isPasswordResetSucceeded) {
//       setState(() => _formType = AuthFormType.login);
//     }
//   }

// // * On Register Verify OTP ==================================================
//   Future<void> onRegisterVerifyOtpHandler() async {
//     if (formKey.currentState?.validate() ?? false) {
//       await _loginViewModel.onRegisterVerifyOtp(
//         userId: userId,
//         phoneNo: phoneNoController.text,
//         otpCode: otpController.text,
//       );
//       if (_loginViewModel.isRegisterSucceeded) {
//         // * Auto login after register
//         await loginHandler();
//       }
//     }
//   }

//   Form otpVerifyForgetPasswordForm() {
//     return Form(
//       key: _changePasswordFormKey,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           verticalSpace(35),
//           const Text("أدخل رمز ال OTP حال استلامه عبر رسائل الـ SMS:"),
//           verticalSpace(10),
//           AppTextFormFieldAddressVersionOne(
//             hintText: 'الرمز',
//             controller: fpOtpController,
//             keyboardType: TextInputType.number,
//             hintStyle: TextStyles.font15BlackRegular,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'يرجى ادخال رمز ال OTP الذي استلمته عبر الرسائل';
//               }
//             },
//             // controller: context.read<LoginCubit>().phoneNumberController,
//           ),
//           verticalSpace(10),
//           // ******-------******* Resend OTP *-*-*-*-*-*-*-*
//           resendOTPCountdown(onPressed: () async {
//             await _loginViewModel.resendOtpForgetPassword(
//                 phoneNo: phoneNoController.text);
//             // countdownController.resetCountdown120();
//           }),
//           verticalSpace(25),
//           AppTextFormFieldAddressVersionOne(
//             hintText: 'كلمة المرور الجديدة',
//             inputTextStyle: TextStyles.font16BlackBold,
//             controller: _newPasswordController,
//             isObscureText: _isObscureNewPassword,
//             hintStyle: TextStyles.font14BlackBold,
//             onChanged: (_) => setState(() {}),
//             suffixIcon: GestureDetector(
//               onTap: () => setState(
//                   () => _isObscureNewPassword = !_isObscureNewPassword),
//               child: Icon(
//                 _isObscureNewPassword ? Icons.visibility_off : Icons.visibility,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'أدخل كلمة المرور الجديدة';
//               }
//             },
//             textInputAction: TextInputAction.next,
//           ),
//           verticalSpace(25),
//           // Confirm New Password
//           AppTextFormFieldAddressVersionOne(
//             hintText: 'تأكيد كلمة المرور الجديدة',
//             inputTextStyle: TextStyles.font16BlackBold,
//             controller: _confirmNewPasswordController,
//             isObscureText: _isObscureConfirmNewPassword,
//             hintStyle: TextStyles.font14BlackBold,
//             onChanged: (_) => setState(() {}),
//             suffixIcon: GestureDetector(
//               onTap: () => setState(() =>
//                   _isObscureConfirmNewPassword = !_isObscureConfirmNewPassword),
//               child: Icon(
//                 _isObscureConfirmNewPassword
//                     ? Icons.visibility_off
//                     : Icons.visibility,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return "أعد ادخال كلمة المرور الجديدة";
//               }
//               // check if it's matched
//               if (value != _newPasswordController.text) {
//                 return 'كلمة المرور غير متطابقة';
//               }
//             },
//             textInputAction: TextInputAction.next,
//           ),

//           verticalSpace(30),

//           AppTextButton(
//             buttonText: "تغيير",
//             isDisabled: !isActionBtnEnabled(),
//             textStyle: TextStyles.font16WhiteBold,
//             onPressed: () async {
//               await fp1And2Handler();
//               // countdownController.resetCountdown120();
//             },
//           ),
//           // AppTextButton(
//           //   buttonText: "ارسال",
//           //   textStyle: TextStyles.font16WhiteBold,
//           //   onPressed: () async {
//           //     if (formKey.currentState?.validate() ?? false) {
//           //       await _loginViewModel.forgetPassowdVerifyOtp(
//           //         phoneNo: phoneNoController.text,
//           //         otpCode: fpOtpController.text,
//           //       );
//           //       // if (_loginViewModel.) {
//           //       //   setState(() {
//           //       //     _formType = AuthFormType.login;
//           //       //   });
//           //       // }
//           //     }
//           //   },
//           // ),

//           verticalSpace(30),
//           returnBackToLogin(),
//         ],
//       ),
//     );
//   }

//   Form registerForm() {
//     return Form(
//       key: formKey,
//       // autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           verticalSpace(35),
//           Text(
//             'تسجيل حساب جديد',
//             style: TextStyles.font20PrimaryTextBold,
//             textAlign: TextAlign.start,
//           ),
//           verticalSpace(7),
//           const Text('سجل حساب جديد لكي تتمكن من التسوق'),
//           verticalSpace(50),
//           const Text('رقم الهاتف'),
//           verticalSpace(10),
//           phoneNumberInput(),
//           verticalSpace(25),
//           const Text('كلمة المرور'),
//           verticalSpace(10),
//           passwordInput(),
//           verticalSpace(25),
//           const Text('الاسم الأول'),
//           verticalSpace(10),
//           AppTextFormFieldAddressVersionOne(
//             labelText: '',
//             hintText: 'اكتب الاسم الأول',
//             controller: firstNameController,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'يرجى ادخال الاسم الاول';
//               }
//             },
//             textInputAction: TextInputAction.next,
//           ),
//           verticalSpace(25),
//           const Text('الاسم الأخير'),
//           verticalSpace(10),
//           AppTextFormFieldAddressVersionOne(
//             labelText: '',
//             hintText: 'اكتب الاسم الأخير',
//             controller: lastNameController,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'يرجى ادخال الاسم الأخير';
//               }
//             },
//             textInputAction: TextInputAction.next,
//           ),
//           verticalSpace(40),
//           AppTextButton(
//             buttonText: "تسجيل",
//             textStyle: TextStyles.font16WhiteBold,
//             onPressed: () async {
//               // Get.to(() => EPGScreen(totalPrice: cartController.totalPrice));
//               setState(() {
//                 _formType = AuthFormType.otpVerification;
//               });
//               if (formKey.currentState?.validate() ?? false) {
//                 await registerHandler();
//               }
//               if (_loginViewModel.isOtpSent) {
//                 setState(() {
//                   _formType = AuthFormType.otpVerification;
//                   userId = _loginViewModel.userId;
//                 });
//                 countdownController.startCountdown();
//               }
//             },
//           ),
//           verticalSpace(20),
//           goToLoginForm(),
//           verticalSpace(20),
//         ],
//       ),
//     );
//   }

//   Form otpForm() {
//     return Form(
//       key: formKey,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           verticalSpace(30),
//           const Text("أدخل رمز ال OTP حال استلامه عبر رسائل الـ SMS:"),
//           verticalSpace(10),
//           AppTextFormFieldAddressVersionOne(
//             hintText: 'الرمز',
//             controller: otpController,
//             keyboardType: TextInputType.number,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'يرجى ادخال رمز ال OTP الذي استلمته عبر الرسائل';
//               }
//             },
//             // controller: context.read<LoginCubit>().phoneNumberController,
//           ),
//           verticalSpace(10),
//           // ******-------******* Resend OTP *-*-*-*-*-*-*-*
//           resendOTPCountdown(
//             onPressed: () async {
//               await _loginViewModel.resendOtp(
//                 phoneNo: phoneNoController.text,
//                 userId: userId,
//               );

//               countdownController.resetCountdown();
//             },
//           ),
//           TextButton(
//             onPressed: () async {
//               await _loginViewModel.resendOtp(
//                 phoneNo: phoneNoController.text,
//                 userId: userId,
//               );
//             },
//             child: Text(
//               'اعادة ارسال الرمز مرة اخرى',
//               style: TextStyles.font14BlackBold,
//             ),
//           ),

//           verticalSpace(30),
//           AppTextButton(
//             buttonText: "ارسال",
//             textStyle: TextStyles.font16WhiteBold,
//             onPressed: () async {
//               await onRegisterVerifyOtpHandler();
//             },
//           ),

//           verticalSpace(30),
//           returnBackToRegisteration(),
//         ],
//       ),
//     );
//   }

//   // ! ================= End of Forms ==================

//   Center returnBackToLogin() {
//     return Center(
//       child: Text.rich(
//         TextSpan(
//           children: [
//             TextSpan(
//               text: 'الرجوع الى',
//               style: TextStyles.font16GrayRegular,
//             ),
//             WidgetSpan(
//               alignment: PlaceholderAlignment.middle,
//               child: TextButton(
//                 onPressed: () => setState(() {
//                   _formType = AuthFormType.login;
//                   countdownController.resetCountdown();
//                 }),
//                 style: ButtonStyle(
//                   padding: WidgetStateProperty.all(
//                     const EdgeInsets.only(right: 5),
//                   ),
//                 ),
//                 child: Text(
//                   'تسجيل الدخول',
//                   style: TextStyles.font16PrimaryBold,
//                 ),
//               ),
//             )
//           ],
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Center returnBackToRegisteration() {
//     return Center(
//       child: Text.rich(
//         TextSpan(
//           children: [
//             TextSpan(
//               text: 'الرجوع الى',
//               style: TextStyles.font16GrayRegular,
//             ),
//             WidgetSpan(
//               alignment: PlaceholderAlignment.middle,
//               child: TextButton(
//                 onPressed: () {
//                   setState(() {
//                     _formType = AuthFormType.register;
//                     // countdownController.resetCountdown();
//                   });
//                 },
//                 style: ButtonStyle(
//                   padding: WidgetStateProperty.all(
//                     const EdgeInsets.only(right: 5),
//                   ),
//                 ),
//                 child: Text(
//                   'التسجيل',
//                   style: TextStyles.font16PrimaryBold,
//                 ),
//               ),
//             )
//           ],
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Widget resendOTPCountdown({required void Function()? onPressed}) {
//     return Obx(
//       () => Text.rich(
//         TextSpan(
//           children: [
//             TextSpan(
//               text: 'لم تستلم رمز ال OTP؟',
//               style: TextStyles.font16GrayRegular,
//             ),
//             TextSpan(
//               text: ' اعد الإرسال',
//               style: TextStyles.font16PrimaryBold,
//             ),
//             WidgetSpan(
//               alignment: PlaceholderAlignment.middle,
//               child: countdownController.countdown.value > 0
//                   ? TextButton(
//                       onPressed: onPressed,
//                       style: ButtonStyle(
//                         padding: WidgetStateProperty.all(
//                           const EdgeInsets.only(right: 5),
//                         ),
//                       ),
//                       child: Text(
//                         ' انتظر ${countdownController.countdown.value} ثانية',
//                         style: TextStyles.font16GrayRegular,
//                       ),
//                     )
//                   // *** Resend OTP Button
//                   : TextButton(
//                       onPressed: onPressed,
//                       style: ButtonStyle(
//                         padding: WidgetStateProperty.all(
//                           const EdgeInsets.only(right: 5),
//                         ),
//                       ),
//                       child: Text(
//                         'إعادة إرسال',
//                         style: TextStyles.font16PrimaryBold,
//                       ),
//                     ),
//             )
//           ],
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Center goToLoginForm() {
//     return Center(
//       child: Text.rich(
//         TextSpan(
//           children: [
//             TextSpan(
//               text: 'لديك حساب بالفعل؟',
//               style: TextStyles.font16BlackMedium,
//             ),
//             WidgetSpan(
//               alignment: PlaceholderAlignment.middle,
//               child: TextButton(
//                 onPressed: () => setState(() => _formType = AuthFormType.login),
//                 style: ButtonStyle(
//                   padding: WidgetStateProperty.all(
//                     const EdgeInsets.only(right: 5),
//                   ),
//                 ),
//                 child: Text(
//                   'تسجيل الدخول',
//                   style: TextStyles.font16PrimaryBold,
//                 ),
//               ),
//             )
//           ],
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Center goToRegisterForm() {
//     return Center(
//       child: Text.rich(
//         TextSpan(
//           children: [
//             TextSpan(
//               text: 'ليس لديك حساب؟',
//               style: TextStyles.font16BlackMedium,
//             ),
//             WidgetSpan(
//               alignment: PlaceholderAlignment.middle,
//               child: TextButton(
//                 onPressed: () {
//                   setState(() {
//                     _formType = AuthFormType.register;
//                   });
//                 },
//                 style: ButtonStyle(
//                   padding: WidgetStateProperty.all(
//                     const EdgeInsets.only(right: 0),
//                   ),
//                 ),
//                 child: Text(
//                   'تسجيل',
//                   style: TextStyles.font16PrimaryBold,
//                 ),
//               ),
//             )
//           ],
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   GestureDetector dropDownContainerBuilder(
//       BuildContext context, Widget popupWidget, String title,
//       {double? height}) {
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//         padding: const EdgeInsets.only(bottom: 20),
//         width: Get.width,
//         height: Get.height * 0.5,
//         child: SafeArea(
//           child: Column(
//             children: [
//               const SizedBox(height: 15),
//               Container(
//                 width: 70,
//                 height: 5,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.black.withOpacity(0.1),
//                 ),
//               ),
//               const SizedBox(height: 25),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 15),
//               Expanded(child: popupWidget),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   AppTextFormFieldAddressVersionOne passwordInput() {
//     return AppTextFormFieldAddressVersionOne(
//       labelText: '',
//       hintText: 'ادخل كلمة المرور',
//       controller: passwordController,
//       isObscureText: isObscureText,
//       suffixIcon: IconButton(
//         highlightColor: Colors.transparent,
//         onPressed: () => setState(() => isObscureText = !isObscureText),
//         icon: Icon(
//           isObscureText ? Icons.visibility_off : Icons.visibility,
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'يرجى ادخال كلمة المرور';
//         }
//       },
//     );
//   }

//   Widget phoneNumberInput() {
//     return AppTextFormFieldAddressVersionOne(
//       labelText: '',
//       hintText: 'ادخل رقم الهاتف',
//       controller: phoneNoController,
//       keyboardType: TextInputType.phone,
//       autovalidateMode: AutovalidateMode.onUnfocus,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'يرجى ادخال رقم الهاتف ';
//         }

//         try {
//           // Parse and validate the phone number
//           final phoneNumber = PhoneNumber.parse(
//             value.trim(),
//             callerCountry: IsoCode.IQ,
//           );
//           if (!phoneNumber.isValid()) {
//             return "رقم الهاتف غير صالح";
//           }
//         } catch (e) {
//           return "رقم الهاتف غير صالح";
//         }

//         return null; // Valid phone number
//       },
//       textInputAction: TextInputAction.next,
//       inputFormatters: [
//         FilteringTextInputFormatter.digitsOnly,
//       ],
//     );
//   }
// }
