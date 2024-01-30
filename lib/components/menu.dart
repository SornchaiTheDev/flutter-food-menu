import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/menu.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, required this.menu});

  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    final MenuModel(:name, :calories, :image, :price) = menu;

    void handleOnTap() {
      Navigator.pushNamed(context, "/sald-detail", arguments: menu);
    }

    return GestureDetector(
      onTap: handleOnTap,
      child: Container(
        margin: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 32.0, bottom: 64.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.skew(-0.1, -0.02),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 24.0),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(10.0),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.2),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 28.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontFamily: "FiraSans",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 32.0,
                              ),
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              "🔥 $calories Calories",
                              style: const TextStyle(
                                fontFamily: "FiraSans",
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "\$",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                              ),
                            ),
                            Text(
                              price.toStringAsFixed(2),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 32.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -72.0,
              right: 10.0,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Hero(
                  tag: "salad-image-$name",
                  child: Image.asset(
                    image,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
