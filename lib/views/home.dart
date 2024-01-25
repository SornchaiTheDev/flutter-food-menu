import 'package:flutter/material.dart';
import 'package:flutter_exercise/components/category_list.dart';
import 'package:flutter_exercise/components/menu_list.dart';
import 'package:flutter_exercise/components/searchfood.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      bottomNavigationBar: bottomNavigation(context),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            "Let's eat \nHealthy Food 🍔",
            style: TextStyle(
              fontSize: 36.0,
              fontFamily: "FiraSans",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24.0),
          SearchFood(),
          SizedBox(height: 42.0),
          CategoryList(),
          SizedBox(
            height: 80.0,
          ),
          MenuList(),
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

  AppBar _appbar() {
    return AppBar(
      toolbarHeight: 80,
      scrolledUnderElevation: 0.0,
      leading: Container(
        margin: const EdgeInsets.all(12.0),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.border_all_rounded, size: 36.0),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
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
    );
  }
}
