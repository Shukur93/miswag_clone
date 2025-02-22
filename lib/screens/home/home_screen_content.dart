import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/models/product_model.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/widgets/search_bar_engine.dart';
import 'package:miswag_clone/core/utils/widgets/shimmer_placeholders.dart';
import 'package:miswag_clone/screens/items_screen/items_screen.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  // search controller
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final CartController cartController = Get.put(CartController());



  @override
  Widget build(BuildContext context) {
    // print('===================== ');
    // print('deviceId: $deviceId');
    // print('===================== ');
    return RefreshIndicator(
      onRefresh: () async => (),
      color: ColorsManager.primary,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.only(top: 5, bottom: 5),
          color: ColorsManager.containerBackground,
          child: Column(
            spacing: 15,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Image.asset('assets/images/qi-banner.png'),
                //  grid view
              ),
              SizedBox(
                height: 200,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 2,
                    childAspectRatio: 0.7,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  children: [
                    InkWell(
                      onTap: () => Get.to(() => const ItemsScreen()),
                      child: Image.asset('assets/images/a1.png'),
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const ItemsScreen()),
                      child: Image.asset('assets/images/a2.png'),
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const ItemsScreen()),
                      child: Image.asset('assets/images/a3.png'),
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

  ListView onLoadingListView() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(right: 30, left: 30),
      separatorBuilder: (context, index) => horizontalSpace(15),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const SizedBox(width: 150, child: ShimmerBannerPlaceholder());
      },
    );
  }

  GridView onLoadingGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        // crossAxisCount: 3,
        maxCrossAxisExtent: 150,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1 / 0.7,
      ),
      padding: const EdgeInsets.only(right: 30, left: 30),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ShimmerBannerPlaceholder();
      },
    );
  }
}
