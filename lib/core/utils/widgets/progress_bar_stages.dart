import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';

class ProgressBarStageOne extends StatelessWidget {
  const ProgressBarStageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 30, top: 12),
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  Icons.check_circle,
                ),
              ),
              TextSpan(
                text: '  تسجيل الدخول',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryText,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 15,
          height: 1,
          margin: const EdgeInsets.only(bottom: 12, right: 7, left: 7),
          // color: Colors.red,
          child: const Divider(
            height: 1,
            color: ColorsManager.lightGray,
          ),
        ),
        const Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  Icons.check_circle,
                  color: ColorsManager.lightGray,
                ),
              ),
              TextSpan(
                text: '  الدفع',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.lightGray,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 15,
          height: 1,
          margin: const EdgeInsets.only(bottom: 13, right: 7, left: 7),
          // color: Colors.red,
          child: const Divider(
            height: 1,
            color: ColorsManager.lightGray,
          ),
        ),
        const Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  Icons.check_circle,
                  color: ColorsManager.lightGray,
                ),
              ),
              TextSpan(
                text: '  الاستلام',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.lightGray,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProgressBarStageTwo extends StatelessWidget {
  const ProgressBarStageTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 30, top: 12),
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  Icons.check_circle,
                  color: ColorsManager.green,
                ),
              ),
              TextSpan(
                text: '  تسجيل الدخول',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryText,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 15,
          height: 1,
          margin: const EdgeInsets.only(bottom: 12, right: 7, left: 7),
          // color: Colors.red,
          child: const Divider(
            height: 1,
            color: ColorsManager.lightGray,
          ),
        ),
        const Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  Icons.check_circle,
                  // color: ColorsManager.lightGray,
                ),
              ),
              TextSpan(
                text: '  الدفع',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryText,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 15,
          height: 1,
          margin: const EdgeInsets.only(bottom: 13, right: 7, left: 7),
          // color: Colors.red,
          child: const Divider(
            height: 1,
            color: ColorsManager.lightGray,
          ),
        ),
        const Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  Icons.check_circle,
                  color: ColorsManager.lightGray,
                ),
              ),
              TextSpan(
                text: '  الاستلام',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.lightGray,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProgressBarStageThree extends StatelessWidget {
  const ProgressBarStageThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 0, top: 12),
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  Icons.check_circle,
                  color: ColorsManager.green,
                ),
              ),
              TextSpan(
                text: '  تسجيل الدخول',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryText,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 15,
          height: 1,
          margin: const EdgeInsets.only(bottom: 12, right: 7, left: 7),
          // color: Colors.red,
          child: const Divider(
            height: 1,
            color: ColorsManager.lightGray,
          ),
        ),
        const Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  Icons.check_circle,
                  color: ColorsManager.green,
                ),
              ),
              TextSpan(
                text: '  الدفع',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryText,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 15,
          height: 1,
          margin: const EdgeInsets.only(bottom: 13, right: 7, left: 7),
          // color: Colors.red,
          child: const Divider(
            height: 1,
            color: ColorsManager.lightGray,
          ),
        ),
        const Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  Icons.check_circle,
                  color: ColorsManager.green,
                ),
              ),
              TextSpan(
                text: '  الاستلام',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryText,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
