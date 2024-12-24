import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tomcoffeshop/screens/about_screen.dart';
import 'package:tomcoffeshop/screens/checkout_screen.dart';
import 'package:tomcoffeshop/screens/contact_screen.dart';
import 'package:tomcoffeshop/screens/order_history_screen.dart';
import 'package:tomcoffeshop/screens/order_success_screen.dart';
import 'package:tomcoffeshop/screens/payment_screen.dart';
import 'models/cart_model.dart';
import 'screens/home_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/account_screen.dart';
import 'screens/order_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartModel(),
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
