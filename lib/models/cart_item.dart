import 'menu_item.dart';

class CartItem {
  
  final MenuItem menuItem;
  int quantity;
  final String name;
  final double price;

  CartItem({
    required this.menuItem,
    this.quantity = 1,
    required this.name,
    required this.price,
  });
}
