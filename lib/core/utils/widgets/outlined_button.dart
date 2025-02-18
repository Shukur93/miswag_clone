import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class OutlinedInkedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const OutlinedInkedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Ink(
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            // make it circular outlined button
            border: Border.all(color: ColorsManager.primary),
            borderRadius: BorderRadius.circular(16),
            color: ColorsManager.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Center(
              child: Text(
                text.toUpperCase(),
                style: TextStyles.font16PrimaryBold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
