import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/category.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final CategoryModel(:name, :image, :isActive) = category;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.deepOrange.withOpacity(0.35),
                  blurRadius: 20.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ]
            : [],
      ),
      child: FilledButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(
              left: 6.0,
              right: 12.0,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            isActive ? Colors.deepOrange : Colors.grey[200],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(4.0),
                color: Colors.white,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              name,
              style: TextStyle(
                fontFamily: "FiraSans",
                fontSize: 16.0,
                color: isActive ? Colors.white : Colors.grey[500],
              ),
            )
          ],
        ),
      ),
    );
  }
}
