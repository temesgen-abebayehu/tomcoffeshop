import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomcoffeshop/models/cart_model.dart';
import 'package:tomcoffeshop/widgets/base_scaffold.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    // Automatically mark expired orders
    cart.expireOldOrders();

    final pendingOrders = cart.getPendingOrders();

    if (pendingOrders.isEmpty) {
      return const BaseScaffold(
        title: 'Checkout',
        body: Center(
          child: Text('No pending orders!'),
        ),
      );
    }

    return BaseScaffold(
      title: 'Checkout',
      body: ListView.builder(
        itemCount: pendingOrders.length,
        itemBuilder: (context, index) {
          final order = pendingOrders[index];
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order ID: ${order['id']}'),
                  Text('Placed By: ${order['placedBy']}'),
                  Text('Email: ${order['email']}'),
                  Text('Address: ${order['address']}'),
                  Text('Items: ${order['items']?.join(', ') ?? 'No items'}'),
                  Text('Payment Method: ${order['paymentMethod']}'),
                  Text('Total Price: Birr ${order['totalPrice']}'),
                  Text('Status: ${order['status']}'),
                  Text('Date: ${order['date']}'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      cart.markOrderAsCompleted(order['id']);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                    child: const Text(
                      'Check Order',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
