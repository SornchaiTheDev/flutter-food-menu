import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/order.dart';

class CartModel extends ChangeNotifier {
  List<OrderModel> orders = [];

  int get orderAmount => orders.length;

  bool isAlreadyInCart(OrderModel order) {
    for (OrderModel currentOrder in orders) {
      if (currentOrder.menu.name == order.menu.name) {
        return true;
      }
    }
    return false;
  }

  double get totalPrice {
    double total = 0;
    for (OrderModel order in orders) {
      total += order.menu.price * order.amount;
    }
    return total;
  }

  void addOrder(OrderModel order) {
    if (isAlreadyInCart(order)) {
      int oldOrderIndex =
          orders.indexWhere((element) => element.menu.name == order.menu.name);

      orders[oldOrderIndex].amount += order.amount;
    } else {
      orders.add(order);
    }

    notifyListeners();
  }

  void handleOnPressedMinus(int index) {
    final order = orders[index];
    if (order.amount == 0) return;

    orders[index] = OrderModel(
      menu: orders[index].menu,
      amount: orders[index].amount - 1,
    );
    notifyListeners();
  }

  void handleOnPressedPlus(int index) {
    orders[index] = OrderModel(
      menu: orders[index].menu,
      amount: orders[index].amount + 1,
    );
    notifyListeners();
  }
}
