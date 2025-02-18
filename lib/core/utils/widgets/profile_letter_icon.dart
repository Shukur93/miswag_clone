import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/shimmer_placeholders.dart';

class ProfileLetterIcon extends StatelessWidget {
  final String name;
  final double? circleSize;
  // final double? enLetterSize;
  // final double? arLetterSize;
  final bool isColored;
  final Color? color;
  final TextStyle? textStyle;
  final bool isLoading;

  const ProfileLetterIcon({
    super.key,
    this.circleSize,
    // this.enLetterSize,
    // this.arLetterSize,
    required this.name,
    this.isColored = false,
    this.color,
    this.textStyle,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const ShimmerCirclePlaceholder()
        : Container(
            alignment: Alignment.center,
            width: circleSize ?? 40,
            height: circleSize ?? 40,
            decoration: ShapeDecoration(
              color: color ?? (isColored ? null : ColorsManager.primary),
              shape: const OvalBorder(),
              gradient: isColored
                  ? const LinearGradient(
                      colors: [
                        ColorsManager.disableText,
                        ColorsManager.primary
                      ],
                      begin: FractionalOffset(-0.1, 0.1),
                      end: FractionalOffset(0.1, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    )
                  : null,
            ),
            child: Text(
              // get the first letter of a given name
              name.isNotEmpty ? name.substring(0, 1).toUpperCase() : '',
              style: textStyle ?? TextStyles.font20WhiteMedium,
              textAlign: TextAlign.center,
            ),
          );
  }
}
