import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Tom Coffee Shop'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              color: Colors.brown[100],
              child: const Text(
                'Welcome to Tom Coffee Shop!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu'); // Navigate to Menu Page
              },
              child: const Text('View Menu'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart'); // Navigate to Cart Page
              },
              child: const Text('View Cart'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/account'); // Navigate to Account Page
              },
              child: const Text('My Account'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/orderHistory');
              },
              child: const Text('Order History'),
            ),
          ],
        ),
      ),
    );
  }
}
