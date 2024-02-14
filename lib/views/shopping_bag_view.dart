import 'package:flutter/material.dart';
import 'package:flutter_exercise/components/order_item.dart';
import 'package:flutter_exercise/models/cart_model.dart';
import 'package:provider/provider.dart';

class ShoppingBagView extends StatefulWidget {
  const ShoppingBagView({super.key});

  @override
  State<ShoppingBagView> createState() => _ShoppingBagViewState();
}

class _ShoppingBagViewState extends State<ShoppingBagView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text(
          "Orders",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: MediaQuery.of(context).size.height - 230,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<CartModel>(builder: (context, cart, model) {
                    return Column(
                      children: cart.orders.map((order) {
                        final orderIndex = cart.orders.indexOf(order);
                        return OrderItem(
                          order: order,
                          onPressedMinus: () =>
                              cart.handleOnPressedMinus(orderIndex),
                          onPressedPlus: () =>
                              cart.handleOnPressedPlus(orderIndex),
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Consumer<CartModel>(
                      builder: (context, cart, model) => Text(
                          "\$ ${cart.totalPrice.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.headlineSmall!),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.deepOrange,
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 12.0),
                      ),
                    ),
                    child: Text(
                      "Checkout",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
