// lib/screens/user_info_screen.dart
import 'package:flutter/material.dart';
import 'package:tomcoffeshop/models/cart_model.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                String address = _addressController.text;
                String email = _emailController.text;

                if (name.isNotEmpty && address.isNotEmpty && email.isNotEmpty) {
                  // Store the user information in CartModel
                  Provider.of<CartModel>(context, listen: false).setUserInfo(name, address, email);
                  
                  // Navigate to PaymentScreen
                  Navigator.pushNamed(context, '/payment');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
