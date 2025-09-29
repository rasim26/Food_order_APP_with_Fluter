import 'package:local_food_ordering_app/models/food_item.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final FoodItem item;
  AddToCart(this.item);
}

class RemoveFromCart extends CartEvent {
  final FoodItem item;
  RemoveFromCart(this.item);
}

class IncreaseQuantity extends CartEvent {
  final FoodItem item;
  IncreaseQuantity(this.item);
}

class DecreaseQuantity extends CartEvent {
  final FoodItem item;
  DecreaseQuantity(this.item);
}

class ClearCart extends CartEvent {}
