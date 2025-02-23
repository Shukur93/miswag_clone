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
import 'package:miswag_clone/screens/items_screen/widgets/thumbnail_item_card.dart';

class ListItemCard extends StatefulWidget {
  final Product product;
  const ListItemCard({
    super.key,
    required this.product,
  });

  @override
  State<ListItemCard> createState() => _ListItemCardState();
}

class _ListItemCardState extends State<ListItemCard> {
  final CartController cartController = Get.find();
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => SingleItemScreen(product: widget.product)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      widget.product.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 5,
                    child: widget.product.oldPrice! > 0
                        ? DiscountLabel(
                          discountPercentage: 10,
                        )
                        : SizedBox(),
                  ),
                  Positioned(
                    top: 8,
                    left: 5,
                    child: const NewLabel(),
                  )
                ],
              ),
            ),

            // Details Section
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.name,
                      style: TextStyles.font13BlackBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.product.oldPrice! > 0)
                          Text(
                            thousandFormatter(widget.product.oldPrice!),
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                            ),
                          ),
                        Text(
                          '${thousandFormatter(widget.product.price)} د.ع',
                          style: TextStyles.font16BlackBold,
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => TinyIconButton(
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
                            onPressed: () => favoritesHandler(),
                          ),
                        ),
                        TinyIconButton(
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            size: 18,
                          ),
                          onPressed: () {
                            cartController.addToCart(widget.product, 1);
                            Get.snackbar(
                              'تم إضافة المنتج إلى السلة',
                              '',
                              snackPosition: SnackPosition.TOP,
                              icon:
                                  const Icon(Icons.check, color: Colors.white),
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
