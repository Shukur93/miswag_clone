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
import 'package:miswag_clone/screens/home/home_screen.dart';

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
                  'assets/icons/empty_fav.jpg',
                  width: 200,
                ),
                title: 'المفضلة فارغة',
                subtitle:
                    "يمكنك حفظ منتجاتك المفضلة لشرائها لاحقاً من خلال الضغط على رمز المفضلة",
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
      bottomNavigationBar: cartController.cartItems.isEmpty
          ? null
          : Obx(
              () => Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'المجموع:',
                            style: TextStyles.font16BlackRegular,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '${thousandFormatter(cartController.totalPrice)} دينار',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(30),
                    AppTextButton(
                      buttonText: 'اتمام الطلب',
                      onPressed: () {},
                    ),
                    verticalSpace(30),
                  ],
                ),
              ),
            ),
    );
  }
}
