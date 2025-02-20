import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class ThumbnailItemCard extends StatefulWidget {
  const ThumbnailItemCard({
    super.key,
  });

  @override
  State<ThumbnailItemCard> createState() => _ThumbnailItemCardState();
}

class _ThumbnailItemCardState extends State<ThumbnailItemCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.withAlpha(50),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 150,
                width: double.infinity,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/item1.png',
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        // height: 20,
                        padding: EdgeInsets.only(
                            top: 2, left: 5, right: 5, bottom: 2),
                        decoration: BoxDecoration(
                          color: Colors.green.withAlpha(40),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('جديد', style: TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      tinyIconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                          size: 18,
                          color: isFavorite ? ColorsManager.primary : null,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                      tinyIconButton(
                        icon: Icon(
                          Icons.add_shopping_cart_outlined,
                          size: 18,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Text(
                    'قلاية هوائية 6 لتر 1500 واط Air Fryer',
                    style: TextStyles.font13BlackBold,
                  ),
                  verticalSpace(10),
                  Text(
                    '١٢١٬٠٠٠',
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                    '٧٢٬٦٠٠ د.ع',
                    style: TextStyles.font16BlackBold,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container tinyIconButton({
    required Widget icon,
    required void Function() onPressed,
  }) {
    return Container(
      width: 33,
      height: 33,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(5),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
