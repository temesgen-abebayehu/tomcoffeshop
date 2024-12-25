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
          child: Text(
            'No pending orders!',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      );
    }

    return BaseScaffold(
      title: 'Checkout',
      body: ListView.builder(
        itemCount: pendingOrders.length,
        itemBuilder: (context, index) {
          final order = pendingOrders[index];
          final List<dynamic> items = order['items'] ?? [];

          return Card(
            color: Colors.white,
            shadowColor: Colors.grey,
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID: ${order['id']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('Placed By: ${order['placedBy']}'),
                  Text('Email: ${order['email']}'),
                  Text('Address: ${order['address']}'),
                  const SizedBox(height: 5),
                  const Text(
                    'Items:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...items.map((item) {
                    final name = item['name'] ?? 'Unknown';
                    final quantity = item['quantity'] ?? 1;
                    final price = item['price'] ?? 0.0;
                    return Text('- $name (x$quantity) - Birr $price');
                  }).toList(),
                  const SizedBox(height: 10),
                  Text(
                    'Payment Method: ${order['paymentMethod']}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Total Price: Birr ${order['totalPrice']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Status: ${order['status']}',
                    style: TextStyle(
                      color: order['status'] == 'Pending'
                          ? Colors.orange
                          : Colors.green,
                    ),
                  ),
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
                      'Mark as Completed',
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
