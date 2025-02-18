import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';

Future<dynamic> showAwesomeDialog({
  required String statusDescription,
  required void Function() onPressed,
}) {
  return AwesomeDialog(
    context: Get.context!,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    dialogType: DialogType.warning,
    headerAnimationLoop: false,
    animType: AnimType.scale,
    title: "$statusDescription.",
    titleTextStyle: TextStyles.font18PrimaryBold,
    // btnOkOnPress: () {},
    padding: const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15),
    btnOk: SmallTextButton(
      title: 'حسناً',
      onPressed: onPressed,
    ),
  ).show();
}
