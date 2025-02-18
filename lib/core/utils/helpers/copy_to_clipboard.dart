import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

void copyToClipboardHandler(String text) {
  Clipboard.setData(ClipboardData(text: text)).then((value) {
    Get.snackbar(
      '',
      '',
      duration: const Duration(seconds: 1),
      titleText: Text(
        'تم النسخ',
        style: TextStyles.font16WhiteBold,
      ),
      messageText: Text(
        'تم نسخ الكود إلى الحافظة',
        style: TextStyles.font14WhiteLight,
      ),
      icon: const Padding(
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.check_circle, color: ColorsManager.white),
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorsManager.primary,
    );

    // ScaffoldMessenger.of(Get.context!).showSnackBar(
    //   SnackBar(
    //     backgroundColor: ColorsManager.primary,
    //     content: Text(
    //       'Copied to Clipboard',
    //       style: TextStyles.font16WhiteLight,
    //     ),
    //     duration: const Duration(seconds: 5),
    //     behavior: SnackBarBehavior.floating,
    //     // from top

    //   ),
    // );
  });
}
