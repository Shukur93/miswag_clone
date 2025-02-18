import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'باستخدام هذا التطبيق فإنك توافق على',
            style: TextStyles.font14primaryTextMedium,
          ),
          TextSpan(
            text: ' \nالشروط والأحكام',
            style: TextStyles.font14PrimaryBold.copyWith(height: 1.5),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
