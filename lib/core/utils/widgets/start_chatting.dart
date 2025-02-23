import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/profile_letter_icon.dart';

class StartChatting extends StatelessWidget {
  const StartChatting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.containerBackground,
      padding: EdgeInsets.only(top: 20, left: 15, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  ProfileLetterIcon(name: 'R'),
                  ProfileLetterIcon(name: 'S'),
                  ProfileLetterIcon(name: 'H'),
                ],
              ),
              horizontalSpace(10),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Get.back(),
              ),
            ],
          ),
          verticalSpace(60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مرحباً 👋',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.gray,
                  ),
                ),
                Text(
                  'كيف يمكننا مساعدتك؟',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.blackText,
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(20),
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: ColorsManager.lightGray,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Material(
              color: Colors.transparent,
              child: ListTile(
                title: Text('الرسائل'),
                titleTextStyle: TextStyles.font16BlackBold.copyWith(
                  fontFamily: 'Vazirmatn',
                ),
                trailing:
                    Icon(Icons.message, color: ColorsManager.primary, size: 18),
                tileColor: Colors.white,
                onTap: () => (),
              ),
            ),
          ),
          verticalSpace(10),
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: ColorsManager.lightGray,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Material(
              color: Colors.transparent,
              child: ListTile(
                title: Text('أرسل لنا رسالة'),
                titleTextStyle: TextStyles.font16BlackBold.copyWith(
                  fontFamily: 'Vazirmatn',
                ),
                trailing:
                    Icon(Icons.send, color: ColorsManager.primary, size: 18),
                tileColor: Colors.white,
                onTap: () => (),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
