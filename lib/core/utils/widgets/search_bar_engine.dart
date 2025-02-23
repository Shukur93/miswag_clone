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
      validator: (p0) {},
    );
  }
}
