import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/helpers/text_formatters.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class DiscountBannerOnly extends StatelessWidget {
  const DiscountBannerOnly({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorsManager.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'عرض لفترة محدودة',
        style: TextStyle(
          color: Colors.white,
          height: 1,
        ),
      ),
    );
  }
}

class DiscountDealBanner extends StatelessWidget {
  final double oldPrice;

  const DiscountDealBanner({
    super.key,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorsManager.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'عرض لفترة محدودة',
            style: TextStyle(
              color: Colors.white,
              height: 1,
            ),
          ),
        ),
        horizontalSpace(10),
        // old  price
        CanceledPriceWidget(oldPrice: oldPrice),
      ],
    );
  }
}

class CanceledPriceWidget extends StatelessWidget {
  final double oldPrice;

  const CanceledPriceWidget({super.key, required this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${thousandFormatter(oldPrice)} دينار', // Format the price to two decimal places
      style: const TextStyle(
        fontSize: 16.0,
        color: Colors.grey, // Optional: Make the canceled price appear muted
        decoration: TextDecoration.lineThrough,
        decorationColor: Colors.red, // Optional: Color of the line
        decorationThickness: 2.0, // Optional: Thickness of the line
      ),
    );
  }
}

class NewPriceWidget extends StatelessWidget {
  final double newPrice;
  final TextStyle? style;
  const NewPriceWidget({
    super.key,
    required this.newPrice,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: thousandFormatter(newPrice),
              style: style ?? TextStyles.font32PrimaryTextBold),
          const TextSpan(text: ' دينار'),
        ],
      ),
      // Format the price to two decimal places
      style: const TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}
