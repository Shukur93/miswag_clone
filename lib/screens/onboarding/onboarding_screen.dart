import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';
import 'package:miswag_clone/screens/home/home_screen.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/font_weight_helper.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            verticalSpace(30),
            Flexible(
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/onboarding_cart.png'),
              ),
            ),
            // verticalSpace(30),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مرحباً بك في',
                    style: TextStyles.font20PrimaryTextBold,
                  ),
                  Text(
                    'تبادل إكسبرس',
                    style: TextStyles.font32PrimaryBold.copyWith(height: 2),
                  ),
                  verticalSpace(10),
                  const Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'تطبيق ',
                      ),
                      TextSpan(
                        text: "\"تبادل إكسبرس\" ",
                        style: TextStyle(
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                      TextSpan(
                          text:
                              'يتيح للمستخدمين شراء جميع أنواع ال vouchers وكروت الشحن بشكل سريع وآمن عبر واجهة بسيطة وسهلة الاستخدام.')
                    ], style: TextStyle(fontSize: 16)),
                  ),
                  verticalSpace(45),
                  AppTextButton(
                    buttonText: 'ابدأ الآن!',
                    onPressed: () {
                      Get.to(() => const HomeScreen());
                    },
                  ),
                  verticalSpace(70),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
