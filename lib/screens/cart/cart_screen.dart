import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';

import 'package:miswag_clone/core/models/order/add_order/add_order_request_model.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';
import 'package:miswag_clone/core/utils/widgets/discount_deal_banner.dart';
import 'package:miswag_clone/core/utils/widgets/on_empty_content.dart';
import 'package:miswag_clone/screens/auth/auth_screen.dart';
import 'package:miswag_clone/screens/cart/widgets/cart_card.dart';
import 'package:miswag_clone/screens/home/home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Controllers
  final CartController cartController = Get.put(CartController());



  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          '🛒 سلتي',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Obx(
        () {
          if (cartController.cartItems.isEmpty) {
            return OnEmptyPageContent(
              icon: const Icon(
                Icons.remove_shopping_cart_outlined,
                size: 150,
                color: ColorsManager.lighterGray,
              ),
              title: 'سلتك فارغة! 😁',
              subtitle: 'رجوع',
              // onTap: () => Get.offAll(() => HomeScreen()),
              onTap: () => Get.back(),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: cartController.cartItems.length,
            separatorBuilder: (context, index) => verticalSpace(10),
            itemBuilder: (context, index) {
              final cartItem = cartController.cartItems[index];
              // final item = cartItem.cartItem;

              return CartCard(
                // item: item,
                cartItem: cartItem,
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Row(
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
                    child: NewPriceWidget(
                      newPrice: cartController.totalPrice,
                      style: TextStyles.font20PrimaryTextBold,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(30),
            Obx(
              () => cartController.cartItems.isEmpty
                  ? AppTextButton(
                      isDisabled: true,
                      buttonText: 'اتمام الطلب',
                      onPressed: () {},
                    )
                  : AppTextButton(
                      buttonText: 'اتمام الطلب',
                      onPressed: () async {
                      
                      },
                    ),
            ),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}
