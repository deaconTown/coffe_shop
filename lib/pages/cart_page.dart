import 'package:coffe_shop/components/coffee_tile.dart';
import 'package:coffe_shop/models/coffe.dart';
import 'package:coffe_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove coffee from cart
  void removeCoffe(Coffee coffee) {
    //remove coffee
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);

    //let the user know that the item was removed from the cart successfully
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.redAccent,
              title: Text('${coffee.name} was removed from cart'),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
            ));
  }

  //pay button tapped
  void payNow() {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              backgroundColor: Colors.brown,
              title: Text('Payment successful. Thank you and come again'),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(
                height: 25,
              ),
              //list of coffee in user cart
              Expanded(
                  child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (context, index) {
                  Coffee eachCoffee = value.userCart[index];
                  return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => removeCoffe(eachCoffee),
                      icon: const Icon(Icons.delete));
                },
              )),

              //pay button
              GestureDetector(
                onTap: payNow,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
