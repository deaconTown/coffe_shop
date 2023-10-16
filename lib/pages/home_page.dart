import 'package:coffe_shop/components/bottom_nav_bar.dart';
import 'package:coffe_shop/constants.dart';
import 'package:coffe_shop/pages/cart_page.dart';
import 'package:coffe_shop/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //navigate bottom bar
  int _selectedIndex = 0;

  void navigateBottonBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottonBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
