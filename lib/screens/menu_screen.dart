import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/menu_item.dart';
import '../models/cart_item.dart'; // Add this line to import CartItem

class MenuScreen extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Black Coffee',
      description: 'Rich and bold black coffee.',
      price: 12.0,
      image: 'lib/images/black_coffee.png',
    ),
    MenuItem(
      name: 'Cold Coffee',
      description: 'Refreshing iced coffee.',
      price: 15.0,
      image: 'lib/images/cold_coffee.png',
    ),
    MenuItem(
      name: 'Espresso',
      description: 'Strong and energizing espresso shot.',
      price: 14.0,
      image: 'lib/images/espresso.png',
    ),
    MenuItem(
      name: 'Cappuccino',
      description: 'Creamy and smooth cappuccino.',
      price: 16.0,
      image: 'lib/images/drop_cup.jpg',
    ),
    MenuItem(
      name: 'Latte',
      description: 'Mild and creamy latte.',
      price: 15.0,
      image: 'lib/images/good_coffee.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final menuItem = menuItems[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(menuItem.image, width: 50, height: 50),
                    title: Text(menuItem.name),
                    subtitle: Text('${menuItem.description} - Birr ${menuItem.price}'),
                    trailing: Icon(Icons.add_shopping_cart),
                    onTap: () {
                      Provider.of<CartModel>(context, listen: false).addItemToCart(CartItem(menuItem: menuItem, name: menuItem.name, price: menuItem.price, quantity: 1));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${menuItem.name} added to cart!')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the payment screen
                Navigator.pushNamed(context, '/cart');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 68, 167, 19),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              child: const Text('Go to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
