import 'package:coffe_shop/components/coffee_tile.dart';
import 'package:coffe_shop/models/coffe.dart';
import 'package:coffe_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add to cart
  void addItemToCart(Coffee coffee) {
    //add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

//let the user know that the item was added to the cart successfully
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              backgroundColor: Colors.brown,
              title: Text('Successfully added to cart'),
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
              //heading text
              const Text(
                'How would you like your coffee?',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),

              //list of coffees to buy

              Expanded(
                child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      Coffee eachCoffee = value.coffeeShop[index];
                      return CoffeeTile(
                        coffee: eachCoffee,
                        onPressed: () => addItemToCart(eachCoffee),
                        icon: const Icon(Icons.add),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
