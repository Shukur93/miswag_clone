import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/models/cart_item.dart';
import 'package:miswag_clone/core/models/product_model.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/helpers/text_formatters.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/tiny_icon_button.dart';

import '../../../core/controllers/favorite/favorite_controller.dart';

class CartCard extends StatefulWidget {
  final Product product;
  final CartItem cartItem;

  const CartCard({
    super.key,
    required this.product,
    required this.cartItem,
  });

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  final CartController cartController = Get.find();
  final FavoriteController favoriteController = Get.put(FavoriteController());

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Text(
                        '${thousandFormatter(widget.product.price)} د.ع',
                        style: TextStyles.font13BlackBold,
                        textDirection: TextDirection.rtl,
                      ),

                      // Quantity + -
                      Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(20),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 35,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Text(
                                  '-',
                                  style: TextStyles.font20BlackRegular,
                                ),
                                onPressed: () {
                                  cartController
                                      .decreaseQuantity(widget.product);
                                },
                              ),
                            ),
                            Text(
                              '${widget.cartItem.quantity}',
                              style: TextStyles.font14BlackBold,
                            ),
                            SizedBox(
                              height: 35,
                              width: 35,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Text(
                                  '+',
                                  style: TextStyles.font20BlackRegular,
                                ),
                                onPressed: () {
                                  cartController.addToCart(widget.product, 1);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                       horizontalSpace(5)
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => TinyIconButton(
                    icon: Icon(
                      favoriteController.isProductInFavorites(widget.product)
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
                ),
                verticalSpace(25),
                // Delete Button
                TinyIconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    size: 15,
                  ),
                  onPressed: () {
                    cartController.removeFromCart(widget.product);
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
