import 'package:flutter_exercise/models/rating.dart';

class MenuModel {
  const MenuModel({
    required this.name,
    required this.image,
    required this.calories,
    required this.price,
    required this.cookingTime,
    required this.rating,
  });

  final String name;
  final String image;
  final double calories;
  final double price;
  final String cookingTime;
  final Rating rating;
}
