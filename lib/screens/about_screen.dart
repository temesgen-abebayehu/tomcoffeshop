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
          child: SingleChildScrollView(
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
                Image(
                  image: AssetImage('lib/images/founder.jpg'),
                  height: 300,
                  width: 300,
                ),
                SizedBox(height: 8),
                Text(
                  'Founder: Temesgen Abebayehu',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),                              
                Image(
                  image: AssetImage('lib/images/employees.jpg'),
                  height: 300,
                  width: 300,
                ),
                SizedBox(height: 8),
                Text(
                  'Employees: Our team is made up of passionate coffee lovers',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  'Our Mission',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Our mission is to provide a cozy and welcoming environment where '
                  'you can enjoy a great cup of coffee and relax.',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ));
  }
}
