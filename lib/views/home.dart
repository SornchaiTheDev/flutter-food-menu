import 'package:flutter/material.dart';
import 'package:flutter_exercise/components/category_list.dart';
import 'package:flutter_exercise/components/menu_list.dart';
import 'package:flutter_exercise/components/searchfood.dart';
import 'package:line_icons/line_icons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(LineIcons.shapes, size: 36.0),
              ),
              Container(
                width: 52.0,
                height: 52.0,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image.network(
                  "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg",
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: const Text(
              "Let's eat \nHealthy Food 🍔",
              style: TextStyle(
                fontSize: 36.0,
                fontFamily: "FiraSans",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          const SearchFood(),
          const SizedBox(height: 42.0),
          const CategoryList(),
          const SizedBox(
            height: 80.0,
          ),
          const MenuList(),
          const SizedBox(
            height: 60.0,
          ),
        ],
      ),
    );
  }

  BottomNavigationBar bottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 0.0,
      unselectedItemColor: Colors.deepOrange,
      selectedItemColor: Colors.deepOrangeAccent,
      type: BottomNavigationBarType.fixed,
      iconSize: 28.0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border,
          ),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart_outlined,
          ),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_2_outlined,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
