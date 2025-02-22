import 'package:miswag_clone/core/models/product_model.dart';

class FavoriteItem {
  final Product product;

  FavoriteItem({required this.product});

  Map<String, dynamic> toJson() => {
        'product': product.toJson(),
      };

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      product: Product.fromJson(json['product']),
    );
  }
}