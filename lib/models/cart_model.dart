// lib/models/cart_model.dart
import 'package:flutter/material.dart';
import 'package:tomcoffeshop/models/cart_item.dart';
import 'package:tomcoffeshop/models/order_model.dart';

class CartModel extends ChangeNotifier {
  String _userName = 'Tom';
  String _userAddress = 'addis ababa';
  String _userEmail = 'tom@gmail.com';
  final List<String> _orderHistory = [];
  final List<CartItem> _items = []; // Stores cart items

  List<CartItem> get cartItems => _items;

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price);

  // Setter for user info
  void setUserInfo(String name, String address, String email) {
    _userName = name;
    _userAddress = address;
    _userEmail = email;
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
    String order = 'Order placed by: $_userName ($_userEmail)\n'
        'Address: $_userAddress\n'
        'Payment Method: $paymentMethod\n'
        'Items: ${_items.map((item) => item.name).join(', ')}\n'
        'Status: Order Placed\n'
        'Total Price: Birr ${totalPrice.toStringAsFixed(2)}';
    _orderHistory.add(order);
    clearCart();
    notifyListeners();
  }

  // Get order history
  List<String> get orderHistory => _orderHistory;

  // Add a complete order object to history (if needed)
  void addOrder(Order order) {
    // Convert order to a string for display
    String orderDetails = 'Order by ${order.name} (${order.email})\n'
        'Address: ${order.address}\n'
        'Items: ${order.items.join(', ')}\n'
        'Total: \$${order.totalPrice}\n'
        'Items: ${order.items.join(', ')}\n'        
        'Payment Method: Birr ${order.paymentMethod}';
    _orderHistory.add(orderDetails);
    clearCart();
    notifyListeners();
  }
}
