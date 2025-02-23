import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miswag_clone/core/controllers/favorite/favorite_controller.dart';
import 'package:miswag_clone/core/utils/helpers/spacing.dart';
import 'package:miswag_clone/core/utils/themes/colors_manager.dart';
import 'package:miswag_clone/core/utils/widgets/on_empty_content.dart';
import 'package:miswag_clone/screens/favorites/widgets/favorite_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'المفضلة',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: ColorsManager.containerBackground,
        child: Obx(
          () {
            if (favoriteController.favoriteItems.isEmpty) {
              return OnEmptyPageContent(
                icon: Image.asset(
                  'assets/icons/empty_fav.jpg',
                  width: 200,
                ),
                title: 'المفضلة فارغة',
                subtitle:
                    "يمكنك حفظ منتجاتك المفضلة لشرائها لاحقاً من خلال الضغط على رمز المفضلة",
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(10.0),
              itemCount: favoriteController.favoriteItems.length,
              separatorBuilder: (context, index) => verticalSpace(10),
              itemBuilder: (context, index) {
                final favoriteItem = favoriteController.favoriteItems[index];
                final product = favoriteItem.product;

                return FavoriteCard(
                  product: product,
                  favoriteItem: favoriteItem,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
