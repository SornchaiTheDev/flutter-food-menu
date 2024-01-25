class CategoryModel {
  const CategoryModel(
      {required this.name, required this.image, this.isActive = false});

  final String name;
  final String image;
  final bool isActive;
}
