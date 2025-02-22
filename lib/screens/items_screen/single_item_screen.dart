import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/bottom_navbar/bottom_navbar_controller.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/controllers/favorite/favorite_controller.dart';
import 'package:miswag_clone/core/models/cart_item.dart';
import 'package:miswag_clone/core/models/product_model.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/helpers/text_formatters.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/app_bars.dart';
import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';
import 'package:miswag_clone/core/utils/widgets/tiny_icon_button.dart';
import 'package:miswag_clone/screens/home/home_screen.dart';

class SingleItemScreen extends StatefulWidget {
  final Product product;
  const SingleItemScreen({super.key, required this.product});

  @override
  State<SingleItemScreen> createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  final CartController cartController = Get.find();
  final FavoriteController favoriteController = Get.find();
  final BottomNavController bottomNavController = Get.find();

  void favoritesHandler() {
    if (favoriteController.isProductInFavorites(widget.product)) {
      favoriteController.removeFromFavorites(widget.product);
    } else {
      favoriteController.addToFavorites(widget.product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        isSingleItem: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Image.asset(
                widget.product.imageUrl,
                height: 400,
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Obx(
                  () => TinyIconButton(
                    containerSize: 43,
                    icon: Icon(
                      favoriteController.isProductInFavorites(widget.product)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      size: 30,
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
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.product.brand!,
                  style: TextStyles.font18BlackRegular,
                ),
                Text(
                  widget.product.name,
                  style: TextStyles.font16PrimaryTextBold,
                ),
                Divider(height: 60),
                Text(
                  '${thousandFormatter(widget.product.price)} د.ع',
                  style: TextStyles.font20PrimaryTextBold,
                ),
                Divider(height: 60),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Obx(() {
          final existingItem = cartController.cartItems
              .firstWhereOrNull((item) => item.product.id == widget.product.id);
          return existingItem != null
              ? Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: AppTextButton(
                        isOutlinedBtn: true,
                        backgroundColor: ColorsManager.secondary,
                        buttonText: 'اشتري الآن',
                        textStyle: TextStyle(
                          color: ColorsManager.secondary,
                          fontSize: 16,
                        ),
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: ColorsManager.secondary,
                        ),
                        isWithIcon: true,
                        onPressed: () {
                          Get.to(() => HomeScreen());
                        },
                      ),
                    ),
                    horizontalSpace(15),
                    Flexible(child: quantityControls(existingItem)),
                  ],
                )
              : AppTextButton(
                  buttonText: 'اضافة للسلة',
                  backgroundColor: ColorsManager.secondary,
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: ColorsManager.white,
                  ),
                  isWithIcon: true,
                  onPressed: () {
                    cartController.addToCart(widget.product, 1);
                  },
                );
        }),
      ),
    );
  }

  Container quantityControls(CartItem existingItem) {
    return Container(
      height: 52,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ColorsManager.lightGray,
          )
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withAlpha(20),
          //     blurRadius: 10,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: existingItem.quantity == 1
                  ? const Icon(
                      Icons.delete_outline,
                      size: 20,
                    )
                  : Text(
                      '-',
                      style: TextStyles.font24BlackRegular,
                    ),
              onPressed: () {
                cartController.decreaseQuantity(widget.product);
              },
            ),
          ),
          horizontalSpace(5),
          Text(
            '${existingItem.quantity}',
            style: TextStyles.font16BlackBold.copyWith(height: 0),
          ),
          horizontalSpace(5),
          SizedBox(
            height: 35,
            width: 35,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Text(
                '+',
                style: TextStyles.font24BlackRegular,
              ),
              onPressed: () {
                cartController.addToCart(widget.product, 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
