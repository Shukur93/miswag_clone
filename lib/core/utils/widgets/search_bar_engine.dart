import 'package:flutter/material.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
// import 'package:miswag_clone/core/controllers/order/order_controller.dart';
import 'package:miswag_clone/core/utils/widgets/app_text_form_field.dart';

class SearchBarEngine extends StatefulWidget {
  const SearchBarEngine({super.key});

  @override
  State<SearchBarEngine> createState() => _SearchBarEngineState();
}

class _SearchBarEngineState extends State<SearchBarEngine> {
  // final OrderController orderController = Get.put(OrderController());

  // search controller
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppTextFormFieldAddressVersionOne(
      controller: searchController,
      hintText: 'ابحث عن ...',
      hintStyle: TextStyle(color: ColorsManager.gray),
      textDirection: TextDirection.rtl,
      prefixIcon: Icon(Icons.search_rounded, color: ColorsManager.gray),
      // suffixIcon: InkWell(
      //   onTap: () => showSearchModal(),
      //   child: const SizedBox(
      //     width: 70,
      //     height: 50,
      //     child: Center(
      //       child: Text(
      //         '🔎',
      //         style: TextStyle(fontSize: 25),
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //   ),
      // ),
      validator: (p0) {},
      // onFieldSubmitted: (_) => showSearchModal(),
    );
  }

  // void showSearchModal() {
  //   // orderCo
  //   // ntroller.itemsList.clear();
  //   final searchKeyword = searchController.text.trim();
  //   showModal(
  //       SingleChildScrollView(
  //         child: Padding(
  //           padding: const EdgeInsets.all(15.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               // close button
  //               Align(
  //                 alignment: Alignment.centerRight,
  //                 child: IconButton(
  //                   onPressed: () => Get.back(),
  //                   icon: const Icon(
  //                     Icons.close,
  //                     size: 30,
  //                   ),
  //                 ),
  //               ),
  //               verticalSpace(15),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 30.0),
  //                 child: Row(
  //                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       'نتائج البحث',
  //                       style: TextStyles.font20PrimaryTextBold,
  //                       textAlign: TextAlign.start,
  //                     ),
  //                     Text(
  //                       ' ({orderController.itemsList.length})',
  //                       style: TextStyles.font16GrayRegular,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               verticalSpace(25),

  //               // GridContent(searchKeyword: searchKeyword),

  //               verticalSpace(60),
  //             ],
  //           ),
  //         ),
  //       ),
  //       isExpanded: true);
  // }
}
