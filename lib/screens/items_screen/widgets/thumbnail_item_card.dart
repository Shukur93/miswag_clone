import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/controllers/favorite/favorite_controller.dart';
import 'package:miswag_clone/core/models/product_model.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/helpers/text_formatters.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/tiny_icon_button.dart';
import 'package:miswag_clone/screens/items_screen/single_item_screen.dart';

class ThumbnailItemCard extends StatefulWidget {
  final Product product;
  const ThumbnailItemCard({
    super.key,
    required this.product,
  });

  @override
  State<ThumbnailItemCard> createState() => _ThumbnailItemCardState();
}

class _ThumbnailItemCardState extends State<ThumbnailItemCard> {
  // bool isFavorite = false;
  final CartController cartController = Get.find();
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() =>  SingleItemScreen(product: widget.product,)),
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
                      widget.product.imageUrl,
                      width: double.infinity,
                    ),
                    // New label
                    Positioned(
                      top: 10,
                      left: 10,
                      child: NewLabel(),
                    ),
                    // Discount label
                    if (widget.product.oldPrice! > 0)
                      Positioned(
                        top: 10,
                        right: 10,
                        child: DiscountLabel(
                          discountPercentage: 10,
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
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TinyIconButton(
                          icon: Icon(
                            favoriteController
                                    .isProductInFavorites(widget.product)
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            size: 18,
                            color: favoriteController
                                    .isProductInFavorites(widget.product)
                                ? ColorsManager.primary
                                : null,
                          ),
                          onPressed: () {
                            favoritesHandler();
                          },
                        ),
                        TinyIconButton(
                          icon: Icon(
                            Icons.add_shopping_cart_outlined,
                            size: 18,
                          ),
                          onPressed: () {
                            cartController.addToCart(
                              widget.product,
                              1,
                            );
                            Get.snackbar(
                              snackPosition: SnackPosition.TOP,
                              icon: Icon(Icons.check, color: Colors.white),
                              'تم إضافة المنتج إلى السلة',
                              '',
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(10),
                  Text(
                    widget.product.name,
                    style: TextStyles.font13BlackBold,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(10),
                  // old price
                  if (widget.product.oldPrice! > 0)
                    Text(
                      thousandFormatter(widget.product.oldPrice!),
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                  Text(
                    '${thousandFormatter(widget.product.price)} د.ع',
                    style: TextStyles.font16BlackBold,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void favoritesHandler() {
    if (favoriteController.isProductInFavorites(widget.product)) {
      favoriteController.removeFromFavorites(widget.product);
    } else {
      favoriteController.addToFavorites(widget.product);
    }
  }
}

class NewLabel extends StatelessWidget {
  const NewLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      padding: EdgeInsets.only(top: 2, left: 5, right: 5, bottom: 2),
      decoration: BoxDecoration(
        color: Colors.green.withAlpha(40),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'جديد',
        style: TextStyle(
          color: Colors.green,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DiscountLabel extends StatelessWidget {
  final int discountPercentage;
  const DiscountLabel({
    super.key,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2, left: 5, right: 5, bottom: 0),
      decoration: BoxDecoration(
        color: ColorsManager.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'خصم $discountPercentage%',
        style: TextStyle(
          color: ColorsManager.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
