import 'package:miswag_clone/core/models/order/get_items/get_items_response_model.dart';

class CartItem {
  final ItemsData cartItem;
  int quantity;

  CartItem({required this.cartItem, required this.quantity});

  Map<String, dynamic> toJson() => {
        'item': cartItem.toJson(),
        'quantity': quantity,
      };

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      cartItem: ItemsData.fromJson(json['item']),
      quantity: json['quantity'],
    );
  }
}
