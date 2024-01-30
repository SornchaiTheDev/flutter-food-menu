import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/ingredient_model.dart';
import 'package:flutter_exercise/models/menu.dart';
import "package:line_icons/line_icons.dart";

class SaladDetailView extends StatefulWidget {
  const SaladDetailView({
    super.key,
  });

  @override
  State<SaladDetailView> createState() => _SaladDetailViewState();
}

class _SaladDetailViewState extends State<SaladDetailView> {
  bool isFavorite = false;
  int amount = 1;

  void handleOnPressBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final menuModel = ModalRoute.of(context)!.settings.arguments as MenuModel;
    final MenuModel(:name, :calories, :image, :price) = menuModel;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(top: 60.0, left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: handleOnPressBack,
                        icon: const Icon(LineIcons.arrowLeft),
                      ),
                      IconButton(
                        onPressed: () => {},
                        icon: const Icon(LineIcons.shoppingBag),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(10.0))),
                      )
                    ],
                  ),
                ),
                Text(
                  name,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8.0),
                Text("🔥 $calories Calories",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.grey[700])),
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(32.0),
                  child: Hero(
                    tag: "salad-image-$name",
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(24.0, 28.0, 24.0, 0),
                        margin: const EdgeInsets.only(top: 24.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(56.0),
                            topRight: Radius.circular(56.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              blurRadius: 20.0,
                              offset: const Offset(0.0, 2.0),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                buildFavoriteBadge(),
                                const Spacer(),
                                buildCookTime(context),
                              ],
                            ),
                            const SizedBox(height: 24.0),
                            const IngredientsSection(),
                            const SizedBox(height: 24.0),
                            Text(
                              "Details",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              "Veggies and fruits are the best food for you",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.grey[700],
                                  ),
                            ),
                            const SizedBox(height: 24.0),
                            Text(
                              "Price",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text("\$",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.orange)),
                                Text(
                                  "$price",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 40,
                        child: OrderAmount(
                          amount: amount,
                          onPressedMinus: () => setState(() {
                            if (amount > 1) {
                              amount--;
                            }
                          }),
                          onPressedPlus: () => setState(() {
                            amount++;
                          }),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 50,
                        child: FavoriteIcon(
                          isFavorite: isFavorite,
                          onPressed: () =>
                              setState(() => isFavorite = !isFavorite),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: GestureDetector(
              onTap: () => print("Add to cart"),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.white, width: 3.0),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.35),
                      blurRadius: 20.0,
                      offset: const Offset(0.0, 10.0),
                    ),
                  ],
                ),
                width: 80.0,
                height: 80.0,
                child:
                    const Icon(LineIcons.plus, size: 28.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildCookTime(BuildContext context) {
    return Row(
      children: [
        Text(
          "⏰",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(shadows: [
            const Shadow(blurRadius: 10.0, offset: Offset(0.0, 6.0)),
          ]),
        ),
        const SizedBox(width: 10.0),
        Text(
          "10-20 min",
          style: TextStyle(
              fontSize: 24.0,
              color: Colors.grey[700],
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Row buildFavoriteBadge() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          "⭐️",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(width: 8.0),
        const Text('4.9',
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold)),
        const SizedBox(width: 4.0),
        Text('(20+)',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey[700])),
      ],
    );
  }
}

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<IngredientModel> ingredients = [
      IngredientModel(1, Colors.green[50]!),
      IngredientModel(2, Colors.green[50]!),
      IngredientModel(3, Colors.red[50]!),
      IngredientModel(4, Colors.brown[50]!),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ingredients",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
            children: ingredients
                .map((ingredient) => [
                      Container(
                        decoration: BoxDecoration(
                          color: ingredient.color,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        width: 56.0,
                        height: 56.0,
                        child: Image.asset(
                            "assets/images/ingredient-${ingredient.index}.png"),
                      ),
                      const SizedBox(width: 8),
                    ])
                .expand((element) => element)
                .toList())
      ],
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.onPressed,
    required this.isFavorite,
  });

  final VoidCallback onPressed;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    IconData icon = isFavorite ? LineIcons.heartAlt : LineIcons.heart;
    Color color = isFavorite ? Colors.red : Colors.grey;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 20.0,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: 28.0,
        ),
      ),
    );
  }
}

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
