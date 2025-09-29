import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_food_ordering_app/models/food_item.dart';
import 'package:local_food_ordering_app/bloc/cart_bloc.dart';
import 'package:local_food_ordering_app/bloc/cart_event.dart';
import 'package:local_food_ordering_app/bloc/cart_state.dart';
import 'package:local_food_ordering_app/bloc/favourites_bloc.dart';
import 'package:local_food_ordering_app/bloc/favourites_event.dart';
import 'package:local_food_ordering_app/bloc/favourites_state.dart';
import 'package:local_food_ordering_app/widget/overlay_info.dart';


class HomeFoodCard extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> foodNames;
  final List<String> foodPrices;
  final int index;

  const HomeFoodCard({
    super.key,
    required this.imagePaths,
    required this.index,
    required this.foodNames,
    required this.foodPrices,
  });

  @override
  Widget build(BuildContext context) {
    final foodItem = FoodItem(
      id: '${foodNames[index]}_$index',
      name: foodNames[index],
      price: foodPrices[index],
      imagePath: imagePaths[index],
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 130,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagePaths[index]),
              ),
            ),
          ),

          Container(
            width: 130,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.9),
                ],
                stops: [0.6, 1.0],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 45,
            child: OverlayInfo(
              overlay: foodNames[index],
              pricing: foodPrices[index],
            ),
          ),
          // Add to Cart Button
          Positioned(
            bottom: 8,
            right: 8,
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                final quantity = context.read<CartBloc>().getQuantity(
                  foodItem.id,
                );

                if (quantity == 0) {
                  // Show Add Button
                  return GestureDetector(
                    onTap: () {
                      context.read<CartBloc>().add(AddToCart(foodItem));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${foodItem.name} added to cart!'),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<CartBloc>().add(
                              DecreaseQuantity(foodItem),
                            );
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            quantity.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<CartBloc>().add(
                              IncreaseQuantity(foodItem),
                            );
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          //Favourites
          Positioned(
            top: 8,
            right: 8,
            child: BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                final isFavorite = context.read<FavoritesBloc>().isFavorite(
                  foodItem.id,
                );

                return GestureDetector(
                  onTap: () {
                    context.read<FavoritesBloc>().add(ToggleFavorite(foodItem));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isFavorite
                              ? '${foodItem.name} removed from favorites'
                              : '${foodItem.name} added to favorites!',
                        ),
                        backgroundColor: isFavorite
                            ? Colors.orange
                            : Colors.red,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey[600],
                      size: 20,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
