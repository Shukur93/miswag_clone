import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class Headline5 extends StatelessWidget {
  final String title;
  final Color? color;
  const Headline5({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyles.font14Headline.copyWith(color: color),
    );
  }
}

class Headline4 extends StatelessWidget {
  final String title;
  final Color? color;
  const Headline4({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyles.font16PrimaryBold.copyWith(color: color),
    );
  }
}

class Underline extends StatelessWidget {
  final String title;
  final Color? color;
  const Underline({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyles.font13Underline.copyWith(color: color),
    );
  }
}
