import 'package:flutter/material.dart';
import 'package:flutter_exercise/components/bottom_navigation.dart';
import 'package:flutter_exercise/views/favorite_view.dart';
import 'package:flutter_exercise/views/home.dart';
import 'package:flutter_exercise/views/profile_view.dart';
import 'package:flutter_exercise/views/shopping_bag_view.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int selectedIndex = 0;

  void handleOnTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> views = [
    const HomeView(),
    const FavoriteView(),
    const ShoppingBagView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: views[selectedIndex]),
          BottomNavigation(
            selectedIndex: selectedIndex,
            onTap: handleOnTap,
            items: [
              BottomNavigationModel(icon: LineIcons.home),
              BottomNavigationModel(icon: LineIcons.heart),
              BottomNavigationModel(
                icon: LineIcons.shoppingBag,
              ),
              BottomNavigationModel(
                icon: LineIcons.user,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
