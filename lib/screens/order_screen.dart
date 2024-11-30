import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      'orderNumber': '#001',
      'items': 'Black Coffee, Cold Coffee',
      'total': 15.0,
      'status': 'Completed',
    },
    {
      'orderNumber': '#002',
      'items': 'Espresso',
      'total': 6.0,
      'status': 'Processing',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders'), backgroundColor: Colors.brown),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text('Order: ${order['orderNumber']}'),
              subtitle: Text(
                  'Items: ${order['items']}\nTotal: \$${order['total'].toStringAsFixed(2)}\nStatus: ${order['status']}'),
              trailing: Icon(
                order['status'] == 'Completed'
                    ? Icons.check_circle
                    : Icons.hourglass_top,
                color: order['status'] == 'Completed'
                    ? Colors.green
                    : Colors.orange,
              ),
            ),
          );
        },
      ),
    );
  }
}
