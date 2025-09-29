import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_food_ordering_app/bloc/cart_bloc.dart';
import 'package:local_food_ordering_app/bloc/cart_state.dart';
import 'package:local_food_ordering_app/constants/const.dart';
import 'package:local_food_ordering_app/presentation/Auth/auth.dart';
import 'package:local_food_ordering_app/presentation/Screens/MyCart/mycart.dart';
import 'package:local_food_ordering_app/presentation/Screens/favourites/favourites.dart';
import 'package:local_food_ordering_app/presentation/Screens/home/home_area.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeArea(), 
    Favourites(),
    MyCart(),
    Auth(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, cartState) {
          int cartItemsCount = 0;
          if (cartState is CartLoaded) {
            cartItemsCount = cartState.totalItems;
          }

          return BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: AppColors.background,
            selectedItemColor: AppColors.keycolor,
            unselectedItemColor: Colors.black54,
            selectedIconTheme: const IconThemeData(color: AppColors.keycolor),
            unselectedIconTheme: IconThemeData(color: Colors.black54),
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.food_bank_outlined, size: 35),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.favorite_sharp, size: 30),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    const Icon(Icons.shopping_cart),
                    if (cartItemsCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            cartItemsCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                label: 'My Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30),
                label: 'Account',
              ),
            ],
          );
        },
      ),
    );
  }
}
