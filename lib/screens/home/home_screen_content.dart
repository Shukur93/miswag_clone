import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/data/products.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/search_bar_engine.dart';
import 'package:miswag_clone/core/utils/widgets/shimmer_placeholders.dart';
import 'package:miswag_clone/screens/items_screen/items_screen.dart';
import 'package:miswag_clone/screens/items_screen/widgets/thumbnail_item_card.dart';

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
      child: Container(
        color: ColorsManager.containerBackground,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 15),
              color: ColorsManager.white,
              child: SearchBarEngine(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    spacing: 15,
                    children: [
                      banner(imageUrl: 'assets/images/qi-banner.png'),
                      grid1(),
                      doubleListView(),
                      horizontalListView(),
                      banner(imageUrl: 'assets/images/banner_3.png'),
                      verticalSpace(30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget horizontalListView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'وصلت حديثاً',
                style: TextStyles.font16BlackBold,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'مشاهدة المزيد',
                  style: TextStyles.font16GrayRegular.copyWith(
                    color: ColorsManager.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => horizontalSpace(10),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 160,
                child: ThumbnailItemCard(
                  product: products[index],
                ),
              );

              //  ThumbnailItemCard(
              //   product: products[index],
              // );
            },
          ),
        ),
      ],
    );
  }

  SizedBox doubleListView() {
    return SizedBox(
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'الاقسام',
              style: TextStyles.font16BlackBold,
            ),
          ),
          verticalSpace(10),
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 15),
              // shrinkWrap: true,
              // primary: false,
              children: [
                doubleVerticalItem(
                  firstImage: 'assets/images/b1.png',
                  secondImage: 'assets/images/b5.png',
                ),
                horizontalSpace(5),
                doubleVerticalItem(
                  firstImage: 'assets/images/b3.png',
                  secondImage: 'assets/images/b4.png',
                ),
                horizontalSpace(5),
                doubleVerticalItem(
                  firstImage: 'assets/images/b2.png',
                  secondImage: 'assets/images/b6.png',
                ),
                horizontalSpace(5),
                doubleVerticalItem(
                  firstImage: 'assets/images/b7.png',
                  secondImage: 'assets/images/b8.png',
                ),
                horizontalSpace(5),
                doubleVerticalItem(
                  firstImage: 'assets/images/b9.png',
                  secondImage: 'assets/images/b10.png',
                ),
                horizontalSpace(5),
                doubleVerticalItem(
                  firstImage: 'assets/images/b11.png',
                  secondImage: 'assets/images/b12.png',
                ),
                horizontalSpace(5),
                doubleVerticalItem(
                  firstImage: 'assets/images/b13.png',
                  secondImage: 'assets/images/b14.png',
                ),
                horizontalSpace(5),
                doubleVerticalItem(
                  firstImage: 'assets/images/b15.png',
                  secondImage: 'assets/images/b16.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox grid1() {
    return SizedBox(
      height: 180,
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
    );
  }

  Padding banner({
    required String imageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(imageUrl),
      //  grid view
    );
  }

  Column doubleVerticalItem({
    required String firstImage,
    required String secondImage,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset(
            firstImage,
            height: 90,
          ),
        ),
        verticalSpace(10),
        InkWell(
          onTap: () => Get.to(() => const ItemsScreen()),
          child: Image.asset(
            secondImage,
            height: 90,
          ),
        )
      ],
    );
  }
}
