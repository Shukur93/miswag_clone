import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/bottom_navbar/bottom_navbar_controller.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';

import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/search_bar_engine.dart';
import 'package:miswag_clone/screens/cart/cart_screen.dart';
import 'package:miswag_clone/screens/categories/categories_screen.dart';
import 'package:miswag_clone/screens/favorites/favorites_screen.dart';
import 'package:miswag_clone/screens/home/home_screen_content.dart';
import 'package:miswag_clone/screens/more/more_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());
  final CartController cartController = Get.put(CartController());

  // int _selectedIndex = 0;

  void _onItemTapped(int index) =>
      setState(() => bottomNavController.currentIndex.value = index);

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ** ============= Home Screen Tabs ============= ** //
    List<Widget> widgetOptions = <Widget>[
      const HomeScreenContent(),
      const CategoriesScreen(),
      const CartScreen(),
      const MoreScreen(),
    ];
    //
    //
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Get.snackbar(
          //       icon: const Padding(
          //          padding: EdgeInsets.only(right: 30),
          //         child: Icon(Icons.error_outline, color: Colors.white, size: 28,),
          //       ),
          //       "Economy غير متوفر",
          //       '400',
          //       // padding: const EdgeInsets.only(right: 30),
          //       snackPosition: SnackPosition.TOP,
          //       duration: const Duration(seconds: 5),
          //       borderRadius: 13,
          //       backgroundColor: Colors.red,
          //       colorText: ColorsManager.white,
          //     );
          //   }, // Navigate to SearchScreen
          //   child: const Icon(Icons.search),
          // ),

          //
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     showModal(
          //       // isDismissible: false,
          //       showSuccessPayment(),
          //     );
          //   },
          //   child: const Icon(Icons.check_circle_outline),
          // ),
          //
          //
          // app bar
          appBar: myAppBar(),

          body: Obx(
            () => Container(
              child: widgetOptions
                  .elementAt(bottomNavController.currentIndex.value),
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              backgroundColor: ColorsManager.white,
              currentIndex: bottomNavController.currentIndex.value,
              // selectedItemColor: ColorsManager.white,
              // unselectedItemColor: ColorsManager.white.withOpacity(0.5),.
              selectedItemColor: ColorsManager.primary,
              unselectedItemColor: ColorsManager.primaryText,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedLabelStyle:
                  TextStyles.font14primaryTextMedium.copyWith(height: 1.25),
              onTap: _onItemTapped,
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'الرئيسية',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined),
                  label: 'الأقسام',
                ),
                BottomNavigationBarItem(
                  icon: Obx(
                    () => Badge(
                      backgroundColor: ColorsManager.primary,
                      isLabelVisible:
                          cartController.cartItems.isNotEmpty ? true : false,
                      label: cartController.cartItems.isNotEmpty
                          ? Text(
                              cartController.cartItems.length.toString(),
                            )
                          : null,
                      offset: const Offset(-8, 0),
                      child: Icon(Icons.shopping_cart_outlined),
                    ),
                  ),
                  label: 'السلة',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.more_outlined),
                  label: 'المزيد',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      toolbarHeight: 110,
      title: Column(
        children: [
          Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  'assets/images/miswag_logo.png',
                  height: 40,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.to(() => FavoritesScreen()),
                    icon: Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    onPressed: () => Get.to(() => FavoritesScreen()),
                    icon: Icon(Icons.forum_outlined),
                  ),
                  // horizontalSpace(10),
                ],
              ),
            ],
          ),
          verticalSpace(5),
          SearchBarEngine(),
        ],
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () => Get.to(() => FavoritesScreen()),
      //     icon: Icon(Icons.favorite_outline),
      //   ),
      //   IconButton(
      //     onPressed: () => Get.to(() => FavoritesScreen()),
      //     icon: Icon(Icons.forum_outlined),
      //   ),
      //   // to remove humburger menu icon
      //   // SizedBox.shrink()
      //   // horizontalSpace(10),
      // ],
    );
  }
}
