import 'package:bloc/bloc.dart';
import 'package:local_food_ordering_app/models/cart_item_model.dart';
import 'package:local_food_ordering_app/bloc/cart_event.dart';
import 'package:local_food_ordering_app/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<CartItem> _cartItems = [];

  CartBloc() : super(CartInitial()) {
    
    on<AddToCart>((event, emit) {
      final existingIndex = _cartItems.indexWhere(
        (cartItem) => cartItem.foodItem.id == event.item.id
      );

      if (existingIndex >= 0) {
        _cartItems[existingIndex] = _cartItems[existingIndex].copyWith(
          quantity: _cartItems[existingIndex].quantity + 1
        );
      } else {
        _cartItems.add(CartItem(foodItem: event.item));
      }
      _emitCartLoaded();
    });

    on<RemoveFromCart>((event, emit) {
      _cartItems.removeWhere((cartItem) => cartItem.foodItem.id == event.item.id);
      _emitCartLoaded();
    });

    on<IncreaseQuantity>((event, emit) {
      final existingIndex = _cartItems.indexWhere(
        (cartItem) => cartItem.foodItem.id == event.item.id
      );

      if (existingIndex >= 0) {
        _cartItems[existingIndex] = _cartItems[existingIndex].copyWith(
          quantity: _cartItems[existingIndex].quantity + 1
        );
        _emitCartLoaded();
      }
    });

    on<DecreaseQuantity>((event, emit) {
      final existingIndex = _cartItems.indexWhere(
        (cartItem) => cartItem.foodItem.id == event.item.id
      );

      if (existingIndex >= 0) {
        if (_cartItems[existingIndex].quantity > 1) {
          _cartItems[existingIndex] = _cartItems[existingIndex].copyWith(
            quantity: _cartItems[existingIndex].quantity - 1
          );
        } else {
          _cartItems.removeAt(existingIndex);
        }
        _emitCartLoaded();
      }
    });

    on<ClearCart>((event, emit) {
      _cartItems.clear();
      _emitCartLoaded();
    });
  }

  void _emitCartLoaded() {
    final totalPrice = _cartItems.fold<double>(
      0, (sum, item) => sum + item.totalPrice
    );
    final totalItems = _cartItems.fold<int>(
      0, (sum, item) => sum + item.quantity
    );

    emit(CartLoaded(
      cartItems: List.from(_cartItems),
      totalPrice: totalPrice,
      totalItems: totalItems,
    ));
  }

  int getQuantity(String itemId) {
    final cartItem = _cartItems.where(
      (item) => item.foodItem.id == itemId,
    );
    return cartItem.isEmpty ? 0 : cartItem.first.quantity;
  }
}
