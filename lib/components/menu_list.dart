import 'package:flutter/material.dart';
import 'package:flutter_exercise/components/menu.dart';
import 'package:flutter_exercise/models/menu.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    List menus = [
      const MenuModel(
        name: "Vegan bowl",
        image: "assets/images/salad1.png",
        calories: 80,
        price: 30.56,
      ),
      const MenuModel(
        name: "Caesar salad",
        image: "assets/images/salad2.png",
        calories: 50,
        price: 29.99,
      ),
      const MenuModel(
        name: "Chicken Salad",
        image: "assets/images/salad3.png",
        calories: 200,
        price: 23.52,
      ),
    ];
    return Column(children: menus.map((menu) => Menu(menu: menu)).toList());
  }
}
