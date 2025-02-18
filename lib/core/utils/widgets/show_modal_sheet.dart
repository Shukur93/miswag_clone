import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<void> showModal(
  Widget content, {
  bool isDismissible = true,
  bool isExpanded = false,
}) async {
  showCupertinoModalBottomSheet(
    expand: isExpanded,
    enableDrag: true,
    isDismissible: isDismissible,
    context: Get.context!,
    backgroundColor: Colors.white,
    barrierColor: const Color.fromARGB(109, 0, 0, 0),
    elevation: 0,
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: content,
    ),
  );
}
