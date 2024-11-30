// lib/screens/order_history_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomcoffeshop/models/cart_model.dart';
import 'package:tomcoffeshop/widgets/base_scaffold.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    if (cart.orderHistory.isEmpty) {
      return const BaseScaffold(
        title: 'Order History',
        body: Center(
          child: Text('History is empty!'),
        ),
      );
    }
    return BaseScaffold(
      title: 'Order History',
      body: ListView.builder(
        itemCount: cart.orderHistory.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            shadowColor: Colors.grey,
            elevation: 5,
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(cart.orderHistory[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
