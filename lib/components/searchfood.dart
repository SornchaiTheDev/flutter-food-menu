import 'package:flutter/material.dart';

class SearchFood extends StatelessWidget {
  const SearchFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20.0,
            offset: const Offset(0.0, 8.0),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search food...",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Container(
            margin: const EdgeInsets.all(4.0),
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
              ),
              icon: Icon(
                Icons.filter_list,
                color: Theme.of(context).colorScheme.background,
              ),
              onPressed: () {},
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
