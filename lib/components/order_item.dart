import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/menu_model.dart';
import 'package:flutter_exercise/models/order.dart';
import 'package:line_icons/line_icons.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.order,
    required this.onPressedMinus,
    required this.onPressedPlus,
  });

  final OrderModel order;
  final VoidCallback onPressedPlus;
  final VoidCallback onPressedMinus;

  @override
  Widget build(BuildContext context) {
    final OrderModel(:amount, :menu) = order;
    final MenuModel(:name, :image, :price) = menu;

    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: Image.asset(
              image,
              width: 120,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "\$ ${(price * amount).toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: onPressedMinus,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange),
                        iconColor: MaterialStateProperty.all(Colors.white),
                      ),
                      icon: const Icon(LineIcons.minus),
                    ),
                    Expanded(
                        child: Text(
                      amount.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
                    IconButton.filled(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange),
                        iconColor: MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: onPressedPlus,
                      icon: const Icon(LineIcons.plus),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
