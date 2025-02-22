class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String? brand;
  final double? oldPrice;
  final String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.oldPrice,
    this.brand,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'imageUrl': imageUrl,
        'oldPrice': oldPrice,
        'brand': brand,
        'description': description,
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        oldPrice: json['oldPrice'],
        brand: json['brand'],
        description: json['description'],
      );
}
