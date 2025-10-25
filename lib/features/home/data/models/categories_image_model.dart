class CategoriesImageModel {
  final String image;
  final String title;

  CategoriesImageModel({required this.image, required this.title});

  factory CategoriesImageModel.fromMap(Map<String, dynamic> map) {
    return CategoriesImageModel(image: map['image'], title: map['title']);
  }

  Map<String, dynamic> toMap() {
    return {'image': image, 'title': title};
  }
}
