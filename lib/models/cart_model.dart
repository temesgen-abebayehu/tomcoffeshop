// lib/models/cart_model.dart
import 'package:flutter/material.dart';
import 'package:tomcoffeshop/models/cart_item.dart';
import 'package:tomcoffeshop/models/order_model.dart';
import 'package:tomcoffeshop/models/user_model.dart';

class CartModel extends ChangeNotifier {
  final UserModel _user = UserModel(
    id: '1',
    name: 'Temesgen',
    address: 'addis ababa',
    email: 'tom@gmail.com',
    phoneNumber: '1234567890',
    profileImageUrl: 'lib/images/profile.jpg',
  );

  String get userName => _user.name;
  String get userAddress => _user.address;
  String get userEmail => _user.email;
  final List<String> _orderHistory = [];
  final List<CartItem> _items = []; // Stores cart items

  List<CartItem> get cartItems => _items;

  double get totalPrice => _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  // Setter for user info
  void setUserInfo(String name, String address, String email) {
    _user.name = name;
    _user.address = address;
    _user.email = email;
    notifyListeners();
  }

  // Add item to cart
  void addItemToCart(CartItem item) {
    final existingIndex = _items.indexWhere((cartItem) => cartItem.name == item.name);
    if (existingIndex != -1) {
      _items[existingIndex].quantity += 1; // Increase quantity if already in cart
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(CartItem item) {
    final existingIndex = _items.indexWhere((cartItem) => cartItem.name == item.name);
    if (existingIndex != -1) {
      if (_items[existingIndex].quantity > 1) {
        _items[existingIndex].quantity -= 1; // Decrease quantity
      } else {
        _items.removeAt(existingIndex); // Remove item if quantity is 1
      }
    }
    notifyListeners();
  }

  // Clear the cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // Place an order and save in history
  void placeOrder(String paymentMethod) {
    final DateTime now = DateTime.now();
    final String formattedDate = '${now.month}/${now.day}/${now.year} ${now.hour == 0 ? 12 : now.hour % 12}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}';
    
    String order = 'Order placed by: ${_user.name}\n' 
        'Email: (${_user.email})\n'
        'Address: ${_user.address}\n'
        'Payment Method: $paymentMethod\n'
        'Items: ${_items.map((item) => '${item.name} x ${item.quantity}').join(', ')}\n'
        'Status: Order Placed\n'
        'Total Price: Birr ${totalPrice.toStringAsFixed(2)}\n'
        'Date: $formattedDate';
    _orderHistory.add(order);
    clearCart();
    notifyListeners();
  }

  // Get order history
  List<String> get orderHistory => _orderHistory;

  // Add a complete order object to history (if needed)
  void addOrder(Order order) {
    // Convert order to a string for display
    String orderDetails = 'Order by ${order.name}\n'
        'Email: (${order.email})\n'
        'Address: ${order.address}\n'
        'Items: ${order.items.join(', ')}\n'
        'Total Price: Birr ${order.totalPrice}\n'
        'Items: ${order.items.join(', ')}\n'     
        'Status: Order Placed\n'  
        'Payment Method: ${order.paymentMethod}';
    _orderHistory.add(orderDetails);
    clearCart();
    notifyListeners();
  }
}
