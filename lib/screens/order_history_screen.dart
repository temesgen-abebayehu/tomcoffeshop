// lib/screens/order_history_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomcoffeshop/models/cart_model.dart';

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    if (cart.orderHistory.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Order History'),
          backgroundColor: Colors.brown,
        ),
        body: Center(
          child: Text('History is empty!'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: cart.orderHistory.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            shadowColor: Colors.grey,
            elevation: 5,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
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
