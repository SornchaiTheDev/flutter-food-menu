import 'package:flutter_exercise/models/menu_model.dart';

class OrderModel {
  final MenuModel menu;
  int amount;

  void addAmount(int amount) {
    this.amount += amount;
  }

  OrderModel({
    required this.menu,
    required this.amount,
  });
}
