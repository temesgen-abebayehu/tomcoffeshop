import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomcoffeshop/widgets/base_scaffold.dart';
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
    return BaseScaffold(
      title: 'Menu',
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
                      _showAddToCartDialog(context, menuItem);
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

  void _showAddToCartDialog(BuildContext context, MenuItem menuItem) {
    int quantity = 1;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Add ${menuItem.name} to Cart'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Enter quantity:'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false).addItemToCart(
                      CartItem(
                        name: menuItem.name,
                        price: menuItem.price,
                        quantity: quantity,
                      ),
                    );
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${menuItem.name} added to cart!')),
                    );
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
