import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_food_ordering_app/models/food_item.dart';
import 'package:local_food_ordering_app/bloc/favourites_event.dart';
import 'package:local_food_ordering_app/bloc/favourites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final List<FoodItem> _favoriteItems = [];

  FavoritesBloc() : super(FavoritesInitial()) {
    
    on<ToggleFavorite>((event, emit) {
      final existingIndex = _favoriteItems.indexWhere(
        (item) => item.id == event.item.id
      );

      if (existingIndex >= 0) {
        _favoriteItems.removeAt(existingIndex);
      } else {
        _favoriteItems.add(event.item);
      }

      emit(FavoritesLoaded(favouriteItems: List.from(_favoriteItems)));
    });

    on<ClearFavorites>((event, emit) {
      _favoriteItems.clear();
      emit(FavoritesLoaded(favouriteItems: []));
    });
  }

  bool isFavorite(String itemId) {
    return _favoriteItems.any((item) => item.id == itemId);
  }
}
