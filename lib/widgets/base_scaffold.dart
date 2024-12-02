import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const BaseScaffold({super.key, required this.body, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => _showMenu(context),
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {
                // Navigate to account screen
                Navigator.pushNamed(context, '/account');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.brown.shade100, // Light brown background
            ),
          ),
          Column(
            children: [
              Expanded(child: body),
              Footer(),
            ],
          ),
        ],
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.brown,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Menu', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/menu'),
              ),
              ListTile(
                title: const Text('Cart', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/cart'),
              ),
              ListTile(
                title: const Text('CheckOut', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/checkout'),
              ),
              ListTile(
                title: const Text('History', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/orderHistory'),
              ),
              ListTile(
                title: const Text('About', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/about'),
              ),
              ListTile(
                title: const Text('Contact', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/contact'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Enjoy your coffee experience!',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                onPressed: () {
                  // Handle Facebook button press
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.telegram, color: Colors.white),
                onPressed: () {
                  // Handle Telegram button press
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
                onPressed: () {
                  // Handle LinkedIn button press
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
                onPressed: () {
                  // Handle Instagram button press
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '© 2024 Tom Coffee Shop',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
