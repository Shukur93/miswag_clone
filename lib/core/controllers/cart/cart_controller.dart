import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:miswag_clone/core/models/cart_item.dart';
import 'package:miswag_clone/core/models/order/get_items/get_items_response_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs; // Observable list for cart items
  var selectedQuantity = 1.obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  // Add to cart or update quantity
  void addToCart(ItemsData itemData, int quantity) {
    final existingItem =
        cartItems.firstWhereOrNull((item) => item.cartItem.id == itemData.id);
    if (existingItem != null) {
      // Update quantity if item already exists
      // set limit to 10
      if (existingItem.quantity < 10) {
        existingItem.quantity += quantity;
        cartItems.refresh(); // Notify observers
      }
    } else {
      // Add new item to cart
      cartItems.add(CartItem(cartItem: itemData, quantity: quantity));
    }
    saveCart();
  }

// Decrease quantity or remove if it becomes 0
  void decreaseQuantity(ItemsData itemData) {
    final existingItem =
        cartItems.firstWhereOrNull((item) => item.cartItem.id == itemData.id);
    if (existingItem != null) {
      if (existingItem.quantity > 1) {
        existingItem.quantity--;
        cartItems.refresh(); // Notify observers
      } else {
        removeFromCart(itemData);
      }
      saveCart();
    }
  }

  // Remove an item completely from the cart
  void removeFromCart(ItemsData itemData) {
    cartItems.removeWhere((item) => item.cartItem.id == itemData.id);
    saveCart();
  }

  // make a cart item quantity getter
  int getQuantity(ItemsData itemData) {
    final existingItem =
        cartItems.firstWhereOrNull((item) => item.cartItem.id == itemData.id);
    return existingItem?.quantity ?? 0;
  }

  // reset quantity
  void resetQuantity() {
    selectedQuantity.value = 1;
  }

  // Calculate total price
  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + ((item.cartItem.price ?? 0) * item.quantity));

  // Save cart to SharedPreferences
  void saveCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartJson =
        cartItems.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList('cart', cartJson);
  }

  // Load cart from SharedPreferences
  void loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart');
    if (cartJson != null) {
      cartItems.value =
          cartJson.map((item) => CartItem.fromJson(jsonDecode(item))).toList();
    }
  }
}
