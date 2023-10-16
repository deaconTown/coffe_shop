import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

  BottomNavBar({Key? key, required this.onTabChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          color: Colors.grey,
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Colors.brown,
          tabBackgroundColor: const Color.fromARGB(255, 248, 248, 250),
          tabBorderRadius: 24,
          tabActiveBorder: Border.all(color: Colors.brown),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Shop',
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: 'Cart',
            )
          ]),
    );
  }
}
