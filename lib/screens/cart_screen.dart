// screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomcoffeshop/widgets/base_scaffold.dart';
import '../models/cart_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Cart',
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...cart.cartItems.map((item) => ListTile(
                    title: Text('${item.name} X ${item.quantity}'),
                    subtitle: Text("Birr ${item.price}"),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        cart.removeItemFromCart(item);
                      },
                    ),
                  )),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Total: Birr ${cart.totalPrice}'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (cart.cartItems.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('The cart is empty')),
                    );
                    Navigator.pushNamed(context, '/');
                  } else {
                    Navigator.pushNamed(context, '/payment');
                  }
                },
                child: Text('Proceed to Payment'),
              ),
            ],
          );
        },
      ),
    );
  }
}
