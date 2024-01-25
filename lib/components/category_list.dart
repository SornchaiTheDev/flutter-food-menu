import 'package:flutter/material.dart';
import 'package:flutter_exercise/components/category.dart';
import 'package:flutter_exercise/models/category.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      const CategoryModel(
        name: "Salad",
        image: "assets/images/salad.png",
        isActive: true,
      ),
      const CategoryModel(
        name: "Fruits",
        image: "assets/images/fruits.png",
      ),
      const CategoryModel(name: "Pork", image: "assets/images/pork.png"),
    ];
    return SizedBox(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories
            .map((category) =>
                [Category(category: category), const SizedBox(width: 8.0)])
            .expand((element) => element)
            .toList(),
      ),
    );
  }
}
