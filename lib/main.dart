import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tomcoffeshop/screens/about_screen.dart';
import 'package:tomcoffeshop/screens/checkout_screen.dart';
import 'package:tomcoffeshop/screens/contact_screen.dart';
import 'package:tomcoffeshop/screens/order_history_screen.dart';
import 'package:tomcoffeshop/screens/order_success_screen.dart';
import 'package:tomcoffeshop/screens/payment_screen.dart';
import 'package:tomcoffeshop/models/cart_model.dart';
import 'package:tomcoffeshop/models/user_model.dart';
import 'package:tomcoffeshop/screens/home_screen.dart';
import 'package:tomcoffeshop/screens/menu_screen.dart';
import 'package:tomcoffeshop/screens/cart_screen.dart';
import 'package:tomcoffeshop/screens/account_screen.dart';
import 'package:tomcoffeshop/screens/order_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAISriZBbiW2gpZIHFo6tm_w2nxn9wXiGQ",
      projectId: "mc-flutter-project",
      messagingSenderId: "450170598261",
      appId: "1:450170598261:android:38c37652210a88ac3c193c",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartModel>(
      create: (context) {
        // Create a UserModel
        final user = UserModel(
          id: '1',
          name: 'Temesgen',
          email: 'tom@aastu.com',
          phoneNumber: '+251 911 223344',
          address: 'Addis Ababa, Ethiopia',
          profileImageUrl: 'lib/images/profile.jpg',
        );

        // Create CartModel and initialize with the user
        final cartModel = CartModel(user: user);

        // Optionally, initialize cart data from Firebase or elsewhere
        cartModel.initializeCartModel(user.id);

        return cartModel;
      },
      child: MaterialApp(
        title: 'Tom Coffee Shop',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/menu': (context) => MenuScreen(),
          '/cart': (context) => CartScreen(),
          '/orders': (context) => OrderScreen(),
          '/account': (context) => EditAccountScreen(),
          '/payment': (context) => PaymentScreen(),
          '/orderSuccess': (context) => OrderSuccessScreen(),
          '/checkout': (context) => CheckoutScreen(),
          '/orderHistory': (context) => HistoryScreen(),
          '/contact': (context) => ContactScreen(),
          '/about': (context) => AboutScreen(),
        },
      ),
    );
  }
}
