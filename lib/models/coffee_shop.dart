import 'package:coffe_shop/models/coffe.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  //coffe for sale list
  final List<Coffee> _shop = [
    //black coffee
    Coffee(
        name: 'Long Black',
        price: '4.10',
        imagePath: "lib/images/hot-coffee.png"),

    //latte
    Coffee(name: 'Latte', price: '4.20', imagePath: 'lib/images/tea.png'),

    //espresso
    Coffee(name: 'Expresso', price: '3.50', imagePath: 'lib/images/pour.png'),

    //iced coffee
    Coffee(
        name: 'Iced Coffee',
        price: '4.40',
        imagePath: 'lib/images/cold-coffee.png'),
  ];

  //user cart
  List<Coffee> _userCart = [];

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
