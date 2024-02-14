import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/cart_model.dart';
import 'package:flutter_exercise/views/bottom_navigation.dart';
import 'package:flutter_exercise/views/home.dart';
import 'package:flutter_exercise/views/salad_detail.dart';
import 'package:flutter_exercise/views/shopping_bag_view.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    ChangeNotifierProvider(
      create: (_) => CartModel(),
      child: MaterialApp(
        title: "Foody Menu",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        theme: ThemeData(),
        routes: {
          "/": (context) => const BottomNavigationView(),
          "/home": (context) => const HomeView(),
          "/sald-detail": (context) => const SaladDetailView(),
          "/orders": (context) => const ShoppingBagView(),
        },
      ),
    ),
  );
}
