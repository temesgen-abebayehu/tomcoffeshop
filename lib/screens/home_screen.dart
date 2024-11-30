import 'package:flutter/material.dart';
import 'package:tomcoffeshop/widgets/base_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Tom Coffee Shop',
      body: Stack(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to Tom Coffee Shop!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      height: 200,
                      child: PageView(
                      children: [
                        Image.asset(
                        'lib/images/bg.png',
                        fit: BoxFit.cover,
                        ),
                        Image.asset(
                        'lib/images/coffee_wellcom.jpg',
                        fit: BoxFit.cover,
                        ),
                        Image.asset(
                        'lib/images/drop_cup.jpg',
                        fit: BoxFit.cover,
                        ),
                        Image.asset(
                        'lib/images/good_coffee.jpg',
                        fit: BoxFit.cover,
                        ),
                      ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Our Posts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildPost(
                    title: 'How to Brew the Perfect Coffee',
                    content:
                        'Learn the art of brewing coffee with our expert tips and tricks.',
                  ),
                  _buildPost(
                    title: 'New Arrivals: Premium Blends',
                    content:
                        'Explore our new collection of premium coffee blends.',
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/menu');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                      ),
                      child: const Text(
                        'Order Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildPost({required String title, required String content}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Card(
      color: Colors.brown.shade50,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
      ),
    ),
  );
}
