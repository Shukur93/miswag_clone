class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String? bundle;
  final String? provider;
  final double? oldPrice;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.bundle,
    this.provider,
    this.oldPrice,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'imageUrl': imageUrl,
        'bundle': bundle,
        'provider': provider,
        'oldPrice': oldPrice,
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        bundle: json['bundle'],
        provider: json['provider'],
        oldPrice: json['oldPrice'],
      );
}
