import 'package:local_food_ordering_app/models/food_item.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<FoodItem> favouriteItems;

  FavoritesLoaded({required this.favouriteItems});
}