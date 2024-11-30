// lib/screens/payment_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomcoffeshop/models/cart_model.dart';
import 'package:tomcoffeshop/widgets/base_scaffold.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context, listen: false);

    return BaseScaffold(
      title: 'Payment',
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              cart.placeOrder('CBE');
              Navigator.pushNamed(context, '/orderSuccess');
            },
            child: const Text('Pay with CBE'),
          ),
          ElevatedButton(
            onPressed: () {
              cart.placeOrder('Abyssinia');
              Navigator.pushNamed(context, '/orderSuccess');
            },
            child: const Text('Pay with Abyssinia'),
          ),
          ElevatedButton(
            onPressed: () {
              cart.placeOrder('M-PESA');
              Navigator.pushNamed(context, '/orderSuccess');
            },
            child: const Text('Pay with M-PESA'),
          ),
          ElevatedButton(
            onPressed: () {
              cart.placeOrder('TeleBirr');
              Navigator.pushNamed(context, '/orderSuccess');
            },
            child: const Text('Pay with TeleBirr'),
          ),
          ElevatedButton(
            onPressed: () {
              cart.placeOrder('Cash');
              Navigator.pushNamed(context, '/orderSuccess');
            },
            child: const Text('Pay with Cash'),
          ),
        ],
      ),
    );
  }
}
