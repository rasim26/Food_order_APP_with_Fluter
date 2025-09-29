import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_food_ordering_app/bloc/cart_bloc.dart';
import 'package:local_food_ordering_app/bloc/cart_event.dart';
import 'package:local_food_ordering_app/bloc/favourites_bloc.dart';
import 'package:local_food_ordering_app/bloc/favourites_event.dart';
import 'package:local_food_ordering_app/bloc/favourites_state.dart';
import 'package:local_food_ordering_app/constants/const.dart';
import 'package:local_food_ordering_app/models/food_item.dart';
import 'package:local_food_ordering_app/widget/main_title.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              H.constHeight,
              const MainTitle(title: "Favourites"),
              const SizedBox(height: 20),
        
              BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, state) {
                  if (state is FavoritesLoaded) {
                    if (state.favouriteItems.isEmpty) {
                      return _emptyFavorites();
                    }
                    return _favoritesList(context, state.favouriteItems);
                  }
                  return _emptyFavorites();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyFavorites() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          Icon(Icons.favorite_border, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No favorites yet',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap the heart icon on items you love!',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _favoritesList(BuildContext context, List<FoodItem> favoriteItems) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: favoriteItems.length,
      itemBuilder: (context, index) {
        final item = favoriteItems[index];
        return _favoriteCard(context, item);
      },
    );
  }

  Widget _favoriteCard(BuildContext context, FoodItem item) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item.imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.8),
                ],
                stops: [0.6, 1.0],
              ),
            ),
          ),

          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                context.read<FavoritesBloc>().add(ToggleFavorite(item));
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.favorite, color: Colors.red, size: 20),
              ),
            ),
          ),

          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹${item.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        context.read<CartBloc>().add(AddToCart(item));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${item.name} added to cart!'),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },

                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}
