import 'package:flutter/material.dart';
import 'package:flutter_exercise/components/menu.dart';
import 'package:flutter_exercise/datasource/menus.dart';
import 'package:flutter_exercise/models/menu.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Favorite",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menus.length,
              itemBuilder: (BuildContext context, int index) {
                MenuModel menu = menus[index];
                return Column(
                  children: [
                    if (index == 0) const SizedBox(height: 30),
                    Menu(menu: menu),
                  ],
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
