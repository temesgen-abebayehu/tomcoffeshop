// lib/screens/payment_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomcoffeshop/models/cart_model.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              cart.placeOrder('PayPal');
              Navigator.pushNamed(context, '/orderSuccess');
            },
            child: Text('Pay with PayPal'),
          ),
          ElevatedButton(
            onPressed: () {
              cart.placeOrder('Credit Card');
              Navigator.pushNamed(context, '/orderSuccess');
            },
            child: Text('Pay with Credit Card'),
          ),
          ElevatedButton(
            onPressed: () {
              cart.placeOrder('Cash');
              Navigator.pushNamed(context, '/orderSuccess');
            },
            child: Text('Pay with Cash'),
          ),
        ],
      ),
    );
  }
}
