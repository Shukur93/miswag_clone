import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';
import 'package:miswag_clone/core/utils/widgets/shimmer_placeholders.dart';

class HorizontalLine extends StatelessWidget {
  final String lineLabel;
  final Widget lineIcon;
  final void Function() onPressedShowAll;
  final Widget child;
  final bool isLoading;
  const HorizontalLine({
    super.key,
    required this.lineLabel,
    required this.lineIcon,
    required this.onPressedShowAll,
    required this.child,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              // recent orders icon
              lineIcon,
              horizontalSpace(6),
              isLoading
                  ? const ShimmerTitlePlaceholder(
                      width: 100,
                    )
                  : Text(
                      lineLabel,
                      style: TextStyles.font18PrimaryTextBold,
                    ),
              const Spacer(),
              MyTextButton(
                text: 'عرض الكل',
                onPressed: onPressedShowAll,
              ),
            ],
          ),
        ),
        verticalSpace(20),
        child,
      ],
    );
  }
}
