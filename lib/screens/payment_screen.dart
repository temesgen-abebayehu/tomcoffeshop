// lib/screens/payment_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomcoffeshop/models/cart_model.dart';
import 'package:tomcoffeshop/widgets/base_scaffold.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context, listen: false);

    void handlePayment(String paymentMethod) {
      if (cart.cartItems.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Your cart is empty. Add items before proceeding!'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        cart.placeOrder(paymentMethod);
        Navigator.pushNamed(context, '/orderSuccess');
      }
    }

    return BaseScaffold(
      title: 'Payment',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose a payment method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            PaymentButton(
              label: 'Pay with CBE',
              onPressed: () => handlePayment('CBE'),
              color: Colors.blue,
            ),
            const SizedBox(height: 10),
            PaymentButton(
              label: 'Pay with Abyssinia',
              onPressed: () => handlePayment('Abyssinia'),
              color: Colors.orange,
            ),
            const SizedBox(height: 10),
            PaymentButton(
              label: 'Pay with M-PESA',
              onPressed: () => handlePayment('M-PESA'),
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            PaymentButton(
              label: 'Pay with TeleBirr',
              onPressed: () => handlePayment('TeleBirr'),
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const PaymentButton({
    required this.label,
    required this.onPressed,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
