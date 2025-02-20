import 'package:flutter/material.dart';

import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final bool isOutlinedBtn;
  final bool isDisabled;
  final Widget? icon;
  final bool isWithIcon;
  final WidgetStateProperty<Color?>? overlayColor;
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    this.isOutlinedBtn = false,
    required this.buttonText,
    this.textStyle,
    required this.onPressed,
    this.isDisabled = false,
    this.icon,
    this.isWithIcon = false,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 16.0,
            ),
            side: BorderSide(
              color: isDisabled
                  ? ColorsManager.disableText
                  : backgroundColor ?? ColorsManager.primary,
              width: 1,
            ),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          isDisabled
              ? ColorsManager.disableText
              : isOutlinedBtn
                  ? Colors.white
                  : backgroundColor ?? ColorsManager.primary,
        ),
        overlayColor: overlayColor ?? WidgetStatePropertyAll(
          isDisabled
              ? Colors.transparent
              : isOutlinedBtn
                  ? ColorsManager.overlayLightSecondary
                  : ColorsManager.overlaySecondary,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 12,
            vertical: verticalPadding ?? 14,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(
            buttonWidth ?? double.maxFinite,
            buttonHeight ?? 52,
          ),
        ),
      ),
      onPressed: isDisabled ? () {} : onPressed,
      child: isWithIcon
          ? Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: icon,
                    ),
                  ),
                  TextSpan(
                    text: buttonText,
                    style: textStyle ?? TextStyles.font16WhiteBold,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            )
          : Text(
              buttonText,
              style: textStyle ?? TextStyles.font16WhiteBold,
            ),
    );
  }
}

class SnackBarActionBtn extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const SnackBarActionBtn({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      alignment: FractionalOffset.bottomLeft,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.disableText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SmallTextButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const SmallTextButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      alignment: FractionalOffset.center,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
          ),
          backgroundColor: const WidgetStatePropertyAll(
            ColorsManager.primary,
          ),
          // overlayColor: const WidgetStatePropertyAll(
          //   ColorsManager.overlayPrimary,
          // ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 5,
            ),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const MyTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
        elevation: WidgetStateProperty.all(0),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.font14PrimaryBold,
      ),
    );
  }
}
