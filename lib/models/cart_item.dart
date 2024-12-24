
class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
