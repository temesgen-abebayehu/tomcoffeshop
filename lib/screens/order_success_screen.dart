// lib/screens/order_success_screen.dart
import 'package:flutter/material.dart';
import 'package:tomcoffeshop/widgets/base_scaffold.dart';

class OrderSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Order Successful',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const Text('Your order was successfully placed!', style: TextStyle(fontSize: 24)),
            const Text('The order will be expired on 12 hour\'s', style: TextStyle(fontSize: 18, color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
