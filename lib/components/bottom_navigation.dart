import 'package:flutter/material.dart';

class BottomNavigationModel {
  BottomNavigationModel({
    required this.icon,
  });
  final IconData icon;
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.items,
  });

  final List<BottomNavigationModel> items;
  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 30,
      right: 30,
      child: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 16.0, bottom: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              offset: const Offset(0, -1),
              blurRadius: 20.0,
            ),
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items
                .map((item) => BottomNavigationItem(
                      item: item,
                      isActive: items.indexOf(item) == selectedIndex,
                      onTap: () => onTap(items.indexOf(item)),
                    ))
                .toList()),
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key,
    required this.item,
    required this.isActive,
    required this.onTap,
  });
  final bool isActive;
  final BottomNavigationModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final BottomNavigationModel(:icon) = item;

    Color iconColor = isActive ? Colors.deepOrange : Colors.grey;
    Color indicatorColor = isActive ? Colors.deepOrange : Colors.transparent;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 24.0, color: iconColor),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 30,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: indicatorColor,
            ),
          ),
        ],
      ),
    );
  }
}
