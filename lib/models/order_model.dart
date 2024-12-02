// lib/models/order_model.dart
class Order {
  final String name;
  final String address;
  final String email;
  final List<String> items;
  final String status;
  final String date;
  final double totalPrice;
  final String paymentMethod;

  Order({
    required this.name,
    required this.address,
    required this.email,
    required this.items,
    required this.status,
    required this.date,
    required this.totalPrice,
    required this.paymentMethod,
  });
}
