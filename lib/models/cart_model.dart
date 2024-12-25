import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tomcoffeshop/models/cart_item.dart';
import 'package:tomcoffeshop/models/user_model.dart';

class CartModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late UserModel _user;
  final List<CartItem> _items = [];
  final List<Map<String, dynamic>> _orders = [];

  // Constructor to initialize _user
  CartModel({required UserModel user}) {
    _user = user;
  }

  // Getters for cart items and orders
  List<CartItem> get cartItems => _items;
  List<Map<String, dynamic>> get orders => _orders;
  String get userName => _user.name;
  String get userAddress => _user.address;
  String get userEmail => _user.email;
  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  // Initialize CartModel data
  Future<void> initializeCartModel(String userId) async {
    try {
      // Fetch user details from Firebase
      _user = await fetchUser(userId);

      // Fetch cart items
      _items.clear();
      _items.addAll(await fetchCartItemsFirebase(userId));

      // Fetch pending orders
      _orders.clear();
      _orders.addAll(await fetchPendingOrdersFirebase(userId));

      notifyListeners();
    } catch (e) {
      debugPrint('Error initializing CartModel: $e');
    }
  }

  // Firebase: Fetch user information
  Future<UserModel> fetchUser(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();

    if (!doc.exists) {
      // Handle the case when the document does not exist
      throw Exception('User document does not exist');
    }

    // Safely access fields and provide fallback values for missing fields
    return UserModel(
      id: userId,
      name: doc['name'] ?? 'Unknown',  // Default to 'Unknown' if 'name' is missing
      address: doc['address'] ?? 'No address provided',
      email: doc['email'] ?? 'No email provided',
      phoneNumber: doc['phoneNumber'] ?? 'No phone number provided',
      profileImageUrl: doc['profileImageUrl'] ?? '',  // Default to empty string if missing
    );
  }

  // Firebase: Add item to cart
  Future<void> addItemToCartFirebase(String userId, CartItem item) async {
    await _firestore.collection('cart').doc(userId).set({
      'items': FieldValue.arrayUnion([item.toJson()]),
      'totalPrice': totalPrice,
      'userId': userId,
    }, SetOptions(merge: true));
  }

  // Firebase: Fetch cart items
  Future<List<CartItem>> fetchCartItemsFirebase(String userId) async {
    final doc = await _firestore.collection('cart').doc(userId).get();
    final List<dynamic> items = doc['items'] ?? [];
    return items.map((item) => CartItem.fromJson(item)).toList();
  }

  // Firebase: Add order
  Future<void> addOrderFirebase(String userId, Map<String, dynamic> order) async {
    await _firestore.collection('orders').add({
      ...order,
      'userId': userId,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Firebase: Fetch pending orders
  Future<List<Map<String, dynamic>>> fetchPendingOrdersFirebase(String userId) async {
    final snapshot = await _firestore
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .where('status', isEqualTo: 'Pending')
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  // Local: Update user information
  void setUserInfo(String name, String address, String email) {
    _user.name = name;
    _user.address = address;
    _user.email = email;
    notifyListeners();
  }

  // Local: Manage cart items
  void addItemToCart(CartItem item) {
    final existingIndex =
        _items.indexWhere((cartItem) => cartItem.name == item.name);
    if (existingIndex != -1) {
      _items[existingIndex].quantity += 1;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItemFromCart(CartItem item) {
    final existingIndex =
        _items.indexWhere((cartItem) => cartItem.name == item.name);
    if (existingIndex != -1) {
      if (_items[existingIndex].quantity > 1) {
        _items[existingIndex].quantity -= 1;
      } else {
        _items.removeAt(existingIndex);
      }
    }
    notifyListeners();
  }

  void clearCartLocal() {
    _items.clear();
    notifyListeners();
  }

  // Local: Manage orders
  void placeOrder(String paymentMethod) {
    final DateTime now = DateTime.now();
    final String formattedDate =
        '${now.month}/${now.day}/${now.year} ${now.hour == 0 ? 12 : now.hour % 12}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}';

    final Map<String, dynamic> orderDetails = {
      'id': DateTime.now().toIso8601String(),
      'placedBy': _user.name,
      'email': _user.email,
      'address': _user.address,
      'items': _items.map((item) => item.toJson()).toList(),
      'paymentMethod': paymentMethod,
      'status': 'Pending',
      'totalPrice': totalPrice.toStringAsFixed(2),
      'date': formattedDate,
      'timestamp': now
    };

    _orders.add(orderDetails);
    clearCartLocal();
    notifyListeners();
  }

  void updateOrderStatus(String orderId, String status) {
    final orderIndex = _orders.indexWhere((order) => order['id'] == orderId);
    if (orderIndex != -1) {
      _orders[orderIndex]['status'] = status;
      notifyListeners();
    }
  }

  void expireOldOrders() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final DateTime now = DateTime.now();
      for (var order in _orders) {
        if (order['status'] == 'Pending' &&
            now.difference(order['timestamp']).inHours >= 12) {
          order['status'] = 'Expired';
        }
      }
      notifyListeners();
    });
  }

  void markOrderAsCompleted(String orderId) {
    final orderIndex = _orders.indexWhere((order) => order['id'] == orderId);
    if (orderIndex != -1) {
      _orders[orderIndex]['status'] = 'Completed';
      notifyListeners();
    }
  }

  // Local: Get order summaries
  List<Map<String, dynamic>> getCompletedAndExpiredOrders() {
    return _orders.where((order) => order['status'] != 'Pending').toList();
  }

  List<Map<String, dynamic>> getPendingOrders() {
    return _orders.where((order) => order['status'] == 'Pending').toList();
  }
}
