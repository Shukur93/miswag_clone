import 'dart:convert';
import 'package:get/get.dart';
import 'package:miswag_clone/core/models/favorite_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:miswag_clone/core/models/product_model.dart';

class FavoriteController extends GetxController {
 var favoriteItems = <FavoriteItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void addToFavorites(Product product) {
    if (!isProductInFavorites(product)) {
      favoriteItems.add(FavoriteItem(product: product));
      saveFavorites();
    }
  }

  void removeFromFavorites(Product product) {
    favoriteItems.removeWhere((item) => item.product.id == product.id);
    saveFavorites();
  }

  bool isProductInFavorites(Product product) {
    return favoriteItems.any((item) => item.product.id == product.id);
  }

  // Save favorites to SharedPreferences
  void saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesJson =
        favoriteItems.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList('favorites', favoritesJson);
  }

  // Load favorites from SharedPreferences
  void loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoritesJson = prefs.getStringList('favorites');
    if (favoritesJson != null) {
      favoriteItems.value = favoritesJson
          .map((item) => FavoriteItem.fromJson(jsonDecode(item)))
          .toList();
    }
  }
}
