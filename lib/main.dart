import 'package:flutter/material.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Foody Menu",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _appbar(),
        bottomNavigationBar: bottomNavigation(context),
        body: body(context),
      ),
    );
  }

  ListView body(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          "Let's eat \nHealthy Food 🍔",
          style: TextStyle(
            fontSize: 36.0,
            fontFamily: "FiraSans",
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24.0),
        renderSearchFood(context),
        const SizedBox(height: 42.0),
        renderCategories(),
        const SizedBox(
          height: 80.0,
        ),
        const Menu(
          name: "Vegan bowl",
          image: "assets/images/salad1.png",
          calories: 80,
          price: 30.56,
        ),
        const Menu(
          name: "Caesar salad",
          image: "assets/images/salad2.png",
          calories: 50,
          price: 29.99,
        ),
        const Menu(
          name: "Chicken Salad",
          image: "assets/images/salad3.png",
          calories: 200,
          price: 23.52,
        ),
      ],
    );
  }

  SizedBox renderCategories() {
    return SizedBox(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Category(
            name: "Salad",
            image: "assets/images/salad.png",
            isActive: true,
          ),
          SizedBox(width: 8.0),
          Category(
            name: "Fruits",
            image: "assets/images/fruits.png",
          ),
          SizedBox(width: 8.0),
          Category(name: "Pork", image: "assets/images/pork.png"),
        ],
      ),
    );
  }

  Container renderSearchFood(BuildContext context) {
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

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.name,
    required this.image,
    required this.calories,
    required this.price,
  });

  final String name;
  final String image;
  final double calories;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 10.0, right: 10.0, top: 32.0, bottom: 64.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.skew(-0.1, -0.02),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    padding: const EdgeInsets.all(10.0),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.2),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 28.0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontFamily: "FiraSans",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 32.0,
                            ),
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            "🔥 $calories Calories",
                            style: const TextStyle(
                              fontFamily: "FiraSans",
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "\$",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                            ),
                          ),
                          Text(
                            price.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -72.0,
            right: 10.0,
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.name,
    required this.image,
    this.isActive = false,
  });

  final String name;
  final String image;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
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
