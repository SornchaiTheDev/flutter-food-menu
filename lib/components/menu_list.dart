import 'package:flutter/material.dart';
import 'package:flutter_exercise/components/menu.dart';
import 'package:flutter_exercise/datasource/menus.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: menus.map((menu) => Menu(menu: menu)).toList());
  }
}
