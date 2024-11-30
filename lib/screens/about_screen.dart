import 'package:flutter/material.dart';
import 'package:tomcoffeshop/widgets/base_scaffold.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'About Us',
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tom Coffee Shop',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to Tom Coffee Shop! We serve the best coffee in town, '
              'crafted with love and care.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Founder: Temesgen Abebayehu',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Image(
              image: AssetImage('lib/images/founder.jpg'),
              height: 100,
              width: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Employees: 20',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Image(
              image: AssetImage('lib/images/employees.jpg'),
              height: 100,
              width: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Our mission is to provide a cozy and welcoming environment where '
              'you can enjoy a great cup of coffee and relax.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
