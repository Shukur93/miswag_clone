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
              color: color ??
                  (isColored ? null : const Color.fromARGB(255, 170, 16, 21)),
              shape: const OvalBorder(
                side: BorderSide(
                    color: Colors.white,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                // get the first letter of a given name
                name.isNotEmpty ? name.substring(0, 1).toUpperCase() : '',
                style: textStyle ??
                    TextStyle(
                        color: Colors.white.withAlpha(200),
                        height: 0,
                        fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
