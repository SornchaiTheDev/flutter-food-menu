import 'package:flutter_exercise/models/menu_model.dart';
import 'package:flutter_exercise/models/rating.dart';

List menus = [
  const MenuModel(
    name: "Vegan bowl",
    image: "assets/images/salad1.png",
    calories: 80,
    price: 30.56,
    cookingTime: "10-20",
    rating: Rating(
      count: 12,
      average: 4.9,
    ),
  ),
  const MenuModel(
    name: "Caesar salad",
    image: "assets/images/salad2.png",
    calories: 50,
    price: 29.99,
    cookingTime: "5-10",
    rating: Rating(
      count: 20,
      average: 3.2,
    ),
  ),
  const MenuModel(
    name: "Chicken Salad",
    image: "assets/images/salad3.png",
    calories: 200,
    price: 23.52,
    cookingTime: "12-14",
    rating: Rating(
      count: 2,
      average: 5.0,
    ),
  ),
];
