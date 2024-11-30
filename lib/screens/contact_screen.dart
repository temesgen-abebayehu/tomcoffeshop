import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Your Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Your Email'),
            ),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(labelText: 'Your Message'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle contact form submission
              },
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}
