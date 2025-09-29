import 'package:local_food_ordering_app/models/food_item.dart';

class CartItem {
  final FoodItem foodItem;
  int quantity;

  CartItem({
    required this.foodItem,
    this.quantity = 1,
  });

  double get totalPrice => double.parse(foodItem.price) * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      foodItem: foodItem,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem && 
      runtimeType == other.runtimeType && 
      foodItem.id == other.foodItem.id;

  @override
  int get hashCode => foodItem.id.hashCode;
}
