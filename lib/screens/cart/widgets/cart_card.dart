import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/models/cart_item.dart';
import 'package:miswag_clone/core/models/order/get_items/get_items_response_model.dart';

import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/helpers/text_formatters.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';

class CartCard extends StatefulWidget {
  // final ItemsData item;
  final CartItem cartItem;

  const CartCard({
    super.key,
    required this.cartItem,
  });

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    // print('itemsData: ${widget.cartItem.cartItem.itemName}');
    // print('cartItem: ${widget.cartItem.cartItem.itemName}');
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() => cartController.removeFromCart(widget.cartItem.cartItem));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              ' تم حذف ${widget.cartItem.cartItem.itemName} من السلة',
              style: const TextStyle(
                color: ColorsManager.white,
              ),
            ),
            duration: const Duration(seconds: 1),
            backgroundColor: ColorsManager.primary,
          ),
        );
      },
      background: Container(
        color: Colors.white,
        child: const Icon(
          Icons.delete_outline_rounded,
          color: ColorsManager.primary,
          size: 50,
        ),
      ),
      child: Card(
        elevation: 0,
        color: const Color(0xFFF6F6F6),
        borderOnForeground: false,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ItemsData Image
              Expanded(
                child: Image.network(
                  widget.cartItem.cartItem.imagePath ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              //  MIDDLE SECTION
              // ItemsData Details
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ItemsData Name
                    // Text(
                    //   '(${widget.cartItem.cartItem.bundle}) ${widget.cartItem.cartItem.name}',
                    //   style: TextStyles.font15BlackRegular,
                    //   textDirection: TextDirection.rtl,
                    // ),
                    verticalSpace(3),
                    // provider Name
                    Text(
                      '${widget.cartItem.cartItem.description}',
                      style: TextStyles.font14GrayRegular,
                      textDirection: TextDirection.rtl,
                    ),
                    verticalSpace(10),
                    // Price
                    Text(
                      '${thousandFormatter((widget.cartItem.cartItem.price ?? 0) * widget.cartItem.quantity)} دينار',
                      style: TextStyles.font16BlackBold,
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              horizontalSpace(10),
              // Action Buttons
              Container(
                width: 40,
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border:
                      Border.all(color: const Color(0xFFD9D9D9), width: 1.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Text(
                          '+',
                          style: widget.cartItem.quantity < 10
                              ? TextStyles.font18PrimaryBold
                              : TextStyles.font18DisableTextkBold,
                        ),
                        onPressed: () {
                          cartController.addToCart(widget.cartItem.cartItem, 1);
                        },
                      ),
                    ),
                    Text(
                      '${widget.cartItem.quantity}',
                      style: TextStyles.font16BlackBold,
                    ),
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Text(
                          '-',
                          style: TextStyles.font18GraykBold,
                        ),
                        onPressed: () {
                          cartController
                              .decreaseQuantity(widget.cartItem.cartItem);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
