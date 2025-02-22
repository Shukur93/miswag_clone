// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
// import 'package:miswag_clone/core/models/order/add_order/add_order_request_model.dart';
// import 'package:miswag_clone/core/models/order/get_items/get_items_response_model.dart';
// import 'package:miswag_clone/core/utils/helpers/spacing.dart';
// import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
// import 'package:miswag_clone/core/utils/themes/styles.dart';
// import 'package:miswag_clone/core/utils/widgets/app_text_button.dart';
// import 'package:miswag_clone/core/utils/widgets/discount_deal_banner.dart';
// import 'package:miswag_clone/core/utils/widgets/show_modal_sheet.dart';
// import 'package:miswag_clone/screens/auth/auth_screen.dart';
// import 'package:miswag_clone/screens/cart/cart_screen.dart';

// class MasterItemModal extends StatefulWidget {
//   final ItemsData item;
//   final Widget child;
//   const MasterItemModal({
//     super.key,
//     required this.item,
//     required this.child,
//   });

//   @override
//   State<MasterItemModal> createState() => _MasterItemModalState();
// }

// class _MasterItemModalState extends State<MasterItemModal> {
//   final CartController cartController = Get.put(CartController());
//   // final OrderController orderController = Get.put(OrderController());

//   final GlobalKey<FormState> _addCardFormKey = GlobalKey();
//   // final AuthenticationManager authenticationManager = Get.find();

//   // Future<void> initAuth() async {
//   //   authenticationManager.checkLoginStatus();
//   //   // await Future.delayed(const Duration(seconds: 3));
//   // }

//   @override
//   void initState() {
//     super.initState();
//     // initAuth();
//   }

//   // Future<void> checkoutOrderHandler() async {
//   //   if (authenticationManager.isLogged.value) {
//   //     final singleOrderItem = AddOrderRequestModel(
//   //       itemId: widget.item.id ?? 0,
//   //       quantity: cartController.selectedQuantity.value,
//   //     );
//   //     await orderController.addOrder(singleItem: singleOrderItem);
//   //     cartController.resetQuantity();
//   //   } else {
//   //     // Navigate to login screen if not logged in
//   //     Get.to(() => AuthScreen(
//   //           item: widget.item,
//   //           isGonnaPurchase: true,
//   //           isFromCart: false,
//   //         ));
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return masterItemSelectorModal(widget.item);
//   }

//   Widget masterItemSelectorModal(ItemsData item) {
//     return InkWell(
//       onTap: () {
//         cartController.resetQuantity();
//         showModal(
//           SingleChildScrollView(
//             child: Form(
//               key: _addCardFormKey,
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // close button
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(
//                         onPressed: () {
//                           Get.back();
//                           cartController.resetQuantity();
//                         },
//                         icon: const Icon(
//                           Icons.close,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                     verticalSpace(15),
//                     Image.network(
//                       item.imagePath ?? '',
//                       width: 200,
//                     ),
//                     verticalSpace(25),
//                     // inner form
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           // item details
//                           // Text.rich(
//                           //   TextSpan(
//                           //     children: [
//                           //       const TextSpan(text: "المجهز:"),
//                           //       TextSpan(
//                           //         text: " ${item.provider}",
//                           //         style: const TextStyle(
//                           //             fontWeight: FontWeight.bold),
//                           //       ),
//                           //     ],
//                           //     style: const TextStyle(fontSize: 17),
//                           //   ),
//                           // ),
//                           verticalSpace(10),
//                           Text.rich(
//                             TextSpan(
//                               children: [
//                                 const TextSpan(text: "الاسم:"),
//                                 TextSpan(
//                                   text: " ${item.itemName}",
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                               style: const TextStyle(fontSize: 17),
//                             ),
//                           ),
//                           verticalSpace(10),
//                           // item details
//                           Text.rich(
//                             TextSpan(
//                               children: [
//                                 const TextSpan(text: "الوصف:"),
//                                 TextSpan(
//                                   text: " ${item.description}",
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                               style: const TextStyle(fontSize: 17),
//                             ),
//                           ),
//                           verticalSpace(10),
//                           // const Text.rich(
//                           //   TextSpan(
//                           //     children: [
//                           //       TextSpan(text: "صالح حتى:"),
//                           //       TextSpan(
//                           //         text: " 12/2025",
//                           //         style: TextStyle(fontWeight: FontWeight.bold),
//                           //       ),
//                           //     ],
//                           //     style: TextStyle(fontSize: 17),
//                           //   ),
//                           // ),
//                           // end of item details

//                           verticalSpace(25),
//                           // price and add button
//                           // // Sale banner
//                           // if (item.oldPrice != null)
//                           //   DiscountDealBanner(
//                           //     oldPrice: item.oldPrice ?? 0,
//                           //   ),
//                           // verticalSpace(10),
//                           // new price
//                           Center(
//                               child:
//                                   NewPriceWidget(newPrice: item.price ?? 0.0)),
//                           verticalSpace(25),
//                           // quantity selector
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 'العدد:',
//                               ),
//                               horizontalSpace(10),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   //! Increase button (+) + + + + + +
//                                   IconButton(
//                                     // onPressed: _increment,
//                                     onPressed: () => setState(() {
//                                       if (cartController
//                                               .selectedQuantity.value <
//                                           10) {
//                                         cartController.selectedQuantity.value++;
//                                       }
//                                     }),
//                                     icon: Obx(
//                                       () => Icon(
//                                         Icons.add,
//                                         color: cartController
//                                                     .selectedQuantity.value <
//                                                 10
//                                             ? ColorsManager.primary
//                                             : ColorsManager.disableText,
//                                       ),
//                                     ),
//                                   ),
//                                   //  Quantity box [ 1 -10 ]
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20.0, vertical: 8.0),
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: Colors.grey.shade400),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     //! QUANTITY TEXT HERE ****
//                                     child: Obx(
//                                       () => Text(
//                                         cartController.selectedQuantity.value
//                                             .toString(),
//                                         style: const TextStyle(
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   //! Decrease button (-) - - - - -
//                                   IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         if (cartController
//                                                 .selectedQuantity.value >
//                                             1) {
//                                           cartController
//                                               .selectedQuantity.value--;
//                                         }
//                                       });
//                                     },
//                                     icon: Obx(
//                                       () => Icon(
//                                         Icons.remove,
//                                         color: cartController
//                                                     .selectedQuantity.value >
//                                                 1
//                                             ? ColorsManager.primaryText
//                                             : ColorsManager.disableText,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           verticalSpace(25),
//                           // ! direct purchase button *-*-*-*-*++*+**++**+*
//                           AppTextButton(
//                             buttonText: 'شراء',
//                             // onPressed: () async => await checkoutOrderHandler(),
//                             onPressed: () {
                              
//                             },
//                           ),
//                           verticalSpace(12),
//                           // ! add to cart button *-*-*-*-*++*+**++**+*
//                           AppTextButton(
//                             buttonText: 'اضف الى السلة',
//                             isOutlinedBtn: true,
//                             textStyle: TextStyles.font16PrimaryBold,
//                             icon: const Icon(
//                               Icons.add_shopping_cart,
//                               color: ColorsManager.primary,
//                             ),
//                             isWithIcon: true,
//                             onPressed: () {
//                               cartController.addToCart(
//                                   item, cartController.selectedQuantity.value);
//                               // cartController.addToCart(
//                               //   item,
//                               //   selectedQuantity,
//                               // );
//                               snackBarAddedItemSuccessfull(item);
//                               Navigator.pop(Get.context!);
//                               cartController.resetQuantity();
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     verticalSpace(50),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//       child: widget.child,
//     );
//   }

//   void snackBarAddedItemSuccessfull(ItemsData item) {
//     ScaffoldMessenger.of(Get.context!).showSnackBar(
//       SnackBar(
//         elevation: 0,
//         duration: const Duration(seconds: 1),
//         backgroundColor: ColorsManager.primary,
//         content: SizedBox(
//           // height: 40,
//           child: InkWell(
//             onTap: () => Get.to(() => const CartScreen()),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Flexible(
//                   child: Icon(
//                     Icons.check_circle,
//                     color: ColorsManager.white,
//                   ),
//                 ),
//                 horizontalSpace(10),
//                 Text(
//                   '${item.itemName} تمت اضافته الى السلة',
//                   style: const TextStyle(
//                     color: ColorsManager.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
