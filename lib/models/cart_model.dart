import 'package:flutter/material.dart';
import 'package:tomcoffeshop/models/cart_item.dart';
import 'package:tomcoffeshop/models/user_model.dart';

class CartModel extends ChangeNotifier {
  final UserModel _user = UserModel(
    id: '1',
    name: 'Temesgen',
    address: 'Addis Ababa',
    email: 'tom@gmail.com',
    phoneNumber: '1234567890',
    profileImageUrl: 'lib/images/profile.jpg',
  );

  final List<CartItem> _items = [];
  final List<Map<String, dynamic>> _orders = [];

  List<CartItem> get cartItems => _items;
  List<Map<String, dynamic>> get orders => _orders;

  String get userName => _user.name;
  String get userAddress => _user.address;
  String get userEmail => _user.email;

  double get totalPrice => _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  // Update user info
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
      _items[existingIndex].quantity += 1;
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
        _items[existingIndex].quantity -= 1;
      } else {
        _items.removeAt(existingIndex);
      }
    }
    notifyListeners();
  }

  // Clear all items from cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // Place an order
  void placeOrder(String paymentMethod) {
    final DateTime now = DateTime.now();
    final String formattedDate =
        '${now.month}/${now.day}/${now.year} ${now.hour == 0 ? 12 : now.hour % 12}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}';

    final Map<String, dynamic> orderDetails = {
      'id': DateTime.now().toIso8601String(),
      'placedBy': _user.name,
      'email': _user.email,
      'address': _user.address,
      'items': _items.map((item) => {
        'name': item.name,
        'price': item.price,
        'quantity': item.quantity,
      }).toList(),
      'paymentMethod': paymentMethod,
      'status': 'Pending',
      'totalPrice': totalPrice.toStringAsFixed(2),
      'date': formattedDate,
      'timestamp': now
    };

    _orders.add(orderDetails);
    clearCart();
    notifyListeners();
  }

  // Update the status of an order
  void markOrderAsCompleted(String orderId) {
    final orderIndex = _orders.indexWhere((order) => order['id'] == orderId);
    if (orderIndex != -1) {
      _orders[orderIndex]['status'] = 'Completed';
      notifyListeners();
    }
  }

  void markOrderAsExpired(String orderId) {
    final orderIndex = _orders.indexWhere((order) => order['id'] == orderId);
    if (orderIndex != -1) {
      _orders[orderIndex]['status'] = 'Expired';
      notifyListeners();
    }
  }

  // Automatically expire orders after 12 hours
  void expireOldOrders() {
    final DateTime now = DateTime.now();
    for (var order in _orders) {
      if (order['status'] == 'Pending' && now.difference(order['timestamp']).inSeconds >= 20) {
        order['status'] = 'Expired';
      }
    }
    notifyListeners();
  }

  // Add order to history
  List<Map<String, dynamic>> getCompletedAndExpiredOrders() {
    return _orders.where((order) => order['status'] != 'Pending').toList();
  }

  List<Map<String, dynamic>> getPendingOrders() {
    return _orders.where((order) => order['status'] == 'Pending').toList();
  }
}
