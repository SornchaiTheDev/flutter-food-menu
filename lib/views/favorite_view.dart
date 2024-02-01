import 'package:flutter/material.dart';
import 'package:flutter_exercise/components/menu.dart';
import 'package:flutter_exercise/datasource/menus.dart';
import 'package:flutter_exercise/models/menu.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 64.0, left: 16.0, right: 16.0),
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
                    Menu(menu: menu),
                    if (index == menus.length - 1) const SizedBox(height: 60),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
