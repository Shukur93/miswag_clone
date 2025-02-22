import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/controllers/favorite/favorite_controller.dart';
import 'package:miswag_clone/core/models/favorite_item.dart';
import 'package:miswag_clone/core/models/product_model.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/helpers/text_formatters.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/tiny_icon_button.dart';

class FavoriteCard extends StatefulWidget {
  final Product product;
  final FavoriteItem favoriteItem;

  const FavoriteCard({
    super.key,
    required this.product,
    required this.favoriteItem,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  final FavoriteController favoriteController = Get.find();
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorsManager.white,
      shadowColor: ColorsManager.lightGray.withAlpha(20),
      borderOnForeground: false,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              child: Image.asset(
                widget.product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            //  MIDDLE SECTION
            // Product Details
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Product Name
                  Text(
                    ' ${widget.product.name}',
                    style: TextStyles.font13BlackBold,
                    textDirection: TextDirection.rtl,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(20),
                  // Product Price
                  Text(
                    '${thousandFormatter(widget.product.price)} د.ع',
                    style: TextStyles.font13BlackBold,
                    textDirection: TextDirection.rtl,
                  ),
                  // Product Quantity
                ],
              ),
            ),
            horizontalSpace(10),

            // Action Buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TinyIconButton(
                  icon: Icon(
                    favoriteController.isProductInFavorites(widget.product)
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    size: 18,
                    color:
                        favoriteController.isProductInFavorites(widget.product)
                            ? ColorsManager.primary
                            : null,
                  ),
                  onPressed: () {
                    favoritesHandler();
                  },
                ),
                verticalSpace(20),
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
