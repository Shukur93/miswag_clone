import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/bottom_navbar/bottom_navbar_controller.dart';
import 'package:miswag_clone/core/controllers/cart/cart_controller.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/themes/styles.dart';
import 'package:miswag_clone/core/utils/widgets/show_modal_sheet.dart';
import 'package:miswag_clone/core/utils/widgets/start_chatting.dart';
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

  void _onItemTapped(int index) =>
      setState(() => bottomNavController.currentIndex.value = index);

  @override
  Widget build(BuildContext context) {
    // ** ============= Home Screen Tabs ============= ** //
    List<Widget> widgetOptions = <Widget>[
      const HomeScreenContent(),
      const CategoryScreen(),
      const CartScreen(),
      MoreScreen(),
    ];
    //
    //
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
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
              selectedItemColor: ColorsManager.primary,
              unselectedItemColor: ColorsManager.primaryText,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedLabelStyle:
                  TextStyles.font14primaryTextMedium.copyWith(height: 1.25),
              onTap: _onItemTapped,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Obx(() => Icon(
                        bottomNavController.currentIndex.value == 0
                            ? Icons.home
                            : Icons.home_outlined,
                      )),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Obx(() => Icon(
                        bottomNavController.currentIndex.value == 1
                            ? Icons.category
                            : Icons.category_outlined,
                      )),
                  label: 'الاقسام',
                ),
                BottomNavigationBarItem(
                  icon: Obx(
                    () => Badge(
                      backgroundColor: ColorsManager.primary,
                      isLabelVisible:
                          cartController.cartItems.isNotEmpty ? true : false,
                      label: cartController.cartItems.isNotEmpty
                          ? Text(cartController.cartItems.length.toString())
                          : null,
                      offset: const Offset(-8, 0),
                      child: Icon(
                        bottomNavController.currentIndex.value == 2
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined,
                      ),
                    ),
                  ),
                  label: 'السلة',
                ),
                BottomNavigationBarItem(
                  icon: Obx(() => Icon(
                        bottomNavController.currentIndex.value == 3
                            ? Icons.pending
                            : Icons.pending_outlined,
                      )),
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
                    onPressed: () => showModal(StartChatting()),
                    icon: Icon(Icons.forum_outlined),
                  ),
                  // horizontalSpace(10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
