import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OrderAmount extends StatelessWidget {
  const OrderAmount({
    super.key,
    required this.amount,
    required this.onPressedPlus,
    required this.onPressedMinus,
  });

  final int amount;
  final VoidCallback onPressedPlus;
  final VoidCallback onPressedMinus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: const BorderRadius.all(
          Radius.circular(100.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrange.withOpacity(0.35),
            blurRadius: 20.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: onPressedMinus,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: const Center(
              child: Icon(
                LineIcons.minus,
                size: 18.0,
                color: Colors.orange,
              ),
            ),
          ),
        ),
        Text(
          "$amount",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        GestureDetector(
          onTap: onPressedPlus,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: const Center(
              child: Icon(
                LineIcons.plus,
                size: 18.0,
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
