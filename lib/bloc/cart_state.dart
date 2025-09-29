import 'package:local_food_ordering_app/models/cart_item_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;
  final double totalPrice;
  final int totalItems;

  CartLoaded({
    required this.cartItems,
    required this.totalPrice,
    required this.totalItems,
  });
}
