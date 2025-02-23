import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';

class WarrentaryShowcase extends StatelessWidget {
  const WarrentaryShowcase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.7,
      color: ColorsManager.containerBackground,
      padding: EdgeInsets.only(top: 20, left: 15, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              horizontalSpace(20),
              Text(
                'Merchant Policy',
                style: TextStyles.font14BlackBold,
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Get.back(),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(25),
                  Text(
                    'الضمان:',
                    style: TextStyles.font16BlackMedium,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyles.font16BlackMedium,
                  ),
                  verticalSpace(25),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: TextStyles.font16BlackMedium,
                  ),
                  verticalSpace(25),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyles.font16BlackMedium,
                  ),
                  verticalSpace(25),
                ],
              ),
            ),
          ),
          AppTextButton(
            buttonText: 'حسناً',
            backgroundColor: ColorsManager.secondary,
            onPressed: () {
              Get.back();
            },
          ),
          verticalSpace(10),
        ],
      ),
    );
  }
}
