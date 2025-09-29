
import '../models/food_item.dart';

// Favorites Events
abstract class FavoritesEvent {}

class ToggleFavorite extends FavoritesEvent {
  final FoodItem item;
  ToggleFavorite(this.item);
}

class ClearFavorites extends FavoritesEvent {}