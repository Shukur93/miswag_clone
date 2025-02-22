import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class OnEmptyPageContent extends StatelessWidget {
  final String? title;
  final Widget? icon;
  final String? subtitle;
  final void Function()? onTap;
  const OnEmptyPageContent({
    super.key,
    this.title,
    this.icon,
    this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            icon ??
                const Icon(
                  Icons.markunread_mailbox_outlined,
                  color: ColorsManager.lighterGray,
                  size: 150,
                ),
            verticalSpace(50),
            // Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Text(
                    title ?? 'لا توجد بيانات',
                    style: TextStyles.font20PrimaryTextBold,
                  ),
                  verticalSpace(15),
                  Text(
                    subtitle ?? '',
                    style: TextStyles.font16BlackRegular,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnEmptyHorizontalListContent extends StatelessWidget {
  final String? title;
  final Icon? icon;
  final String? subtitle;
  final void Function()? onTap;
  const OnEmptyHorizontalListContent({
    super.key,
    this.title,
    this.icon,
    this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon ??
              const Icon(
                Icons.markunread_mailbox_outlined,
                color: ColorsManager.lighterGray,
                size: 40,
              ),
          horizontalSpace(15),
          Text(
            title ?? 'لا توجد بيانات',
            style: TextStyles.font14LightGrayRegular,
          ),
        ],
      ),
    );
  }
}
