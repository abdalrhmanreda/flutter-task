class ProductModel {
  final String image;
  final String title;
  final String oldPrice;
  final String newPrice;
  final String sold;

  ProductModel({
    required this.image,
    required this.title,
    required this.oldPrice,
    required this.newPrice,
    required this.sold,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      image: map['image'],
      title: map['title'],
      oldPrice: map['oldPrice'],
      newPrice: map['newPrice'],
      sold: map['sold'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'oldPrice': oldPrice,
      'newPrice': newPrice,
      'sold': sold,
    };
  }
}
