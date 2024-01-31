import 'package:flutter/material.dart';
import 'package:flutter_exercise/views/bottom_navigation.dart';
import 'package:flutter_exercise/views/home.dart';
import 'package:flutter_exercise/views/salad_detail.dart';

void main() {
  return runApp(MaterialApp(
      title: "Foody Menu",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData(),
      routes: {
        "/": (context) => const BottomNavigationView(),
        "/home": (context) => const HomeView(),
        "/sald-detail": (context) => const SaladDetailView()
      }));
}
