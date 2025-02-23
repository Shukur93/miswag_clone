import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/helpers/text_formatters.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';
import 'package:miswag_clone/core/utils/widgets/on_empty_content.dart';
import 'package:miswag_clone/screens/cart/widgets/cart_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsManager.containerBackground,
        child: Obx(
          () {
            if (cartController.cartItems.isEmpty) {
              return OnEmptyPageContent(
                icon: Image.asset(
                  'assets/icons/empty_cart.jpg',
                  width: 200,
                ),
                title: 'السلة فارغة',
                subtitle:
                    "استكشف المنتجات المتوفرة على مسواگ\nواضف للسلة لبدء التسوق",
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(10.0),
              itemCount: cartController.cartItems.length,
              separatorBuilder: (context, index) => verticalSpace(10),
              itemBuilder: (context, index) {
                final cartItem = cartController.cartItems[index];
                final product = cartItem.product;

                return CartCard(
                  product: product,
                  cartItem: cartItem,
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Obx(
        () => cartController.cartItems.isEmpty
            ? SizedBox()
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        height: 52,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorsManager.grayishGreen.withAlpha(50)),
                        child: Text(
                          '${thousandFormatter(cartController.totalPrice)} د.ع',
                          style: TextStyles.font14BlackBold,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    horizontalSpace(10),
                    Flexible(
                      flex: 2,
                      child: AppTextButton(
                        buttonText: "شراء المنتجات",
                        backgroundColor: ColorsManager.secondary,
                        icon: Icon(
                          Icons.chevron_right_outlined,
                          color: ColorsManager.white,
                          size: 30,
                        ),
                        isWithIcon: true,
                        isIconLeft: true,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
