import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/screens/cart/cart_screen.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  SecondaryAppBar({super.key});

  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerRight,
              onPressed: () => Get.back(),
              iconSize: 20,
              icon: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                  Text(
                    'رجوع',
                    style: TextStyles.font15BlackRegular,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              'وصل حديثاً',
              style: TextStyles.font16BlackBold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Obx(
                () => Badge(
                  backgroundColor: ColorsManager.primary,
                  isLabelVisible:
                      cartController.cartItems.isNotEmpty ? true : false,
                  label: cartController.cartItems.isNotEmpty
                      ? Text(
                          cartController.cartItems.length.toString(),
                        )
                      : null,
                  offset: const Offset(0, 20),
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => const CartScreen());
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 20,
                      color: ColorsManager.primaryText,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.ios_share_outlined,
                  size: 20,
                  color: ColorsManager.primaryText,
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
