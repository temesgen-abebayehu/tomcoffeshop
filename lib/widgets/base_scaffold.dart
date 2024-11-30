import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const BaseScaffold({required this.body, this.title = ''});

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
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () => _showMenu(context),
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.white),
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
                title: Text('Menu', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/menu'),
              ),
              ListTile(
                title: Text('Cart', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/cart'),
              ),
              ListTile(
                title: Text('History', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/orderHistory'),
              ),
              ListTile(
                title: Text('About', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pushNamed(context, '/about'),
              ),
              ListTile(
                title: Text('Contact', style: TextStyle(color: Colors.white)),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enjoy your coffee experience!',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                onPressed: () {
                  // Add your social link logic here
                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.telegram, color: Colors.white),
                onPressed: () {
                  // Add your social link logic here
                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
                onPressed: () {
                  // Add your social link logic here
                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
                onPressed: () {
                  // Add your social link logic here
                },
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '© 2024 Tom Coffee Shop',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
