import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Welcome to Tom Coffee Shop! We serve the best coffee in town, '
          'crafted with love and care.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
