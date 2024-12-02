import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomcoffeshop/models/cart_model.dart';
import 'package:tomcoffeshop/widgets/base_scaffold.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    final completedAndExpiredOrders = cart.getCompletedAndExpiredOrders();

    if (completedAndExpiredOrders.isEmpty) {
      return const BaseScaffold(
        title: 'Order History',
        body: Center(
          child: Text('No order history available!'),
        ),
      );
    }

    return BaseScaffold(
      title: 'Order History',
      body: ListView.builder(
        itemCount: completedAndExpiredOrders.length,
        itemBuilder: (context, index) {
          final order = completedAndExpiredOrders[index];
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
                  Text('Items: ${(order['items'] ?? []).join(', ')}'),
                  Text('Payment Method: ${order['paymentMethod']}'),
                  Text('Total Price: Birr ${order['totalPrice']}'),
                  Text('Status: ${order['status']}'),
                  Text('Date: ${order['date']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
