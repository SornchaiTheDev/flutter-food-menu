import 'package:flutter/material.dart';
import 'package:flutter_exercise/views/home.dart';

void main() {
  return runApp(MaterialApp(
      title: "Foody Menu",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeView(),
      }));
}
