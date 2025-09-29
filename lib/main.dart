import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_food_ordering_app/bloc/cart_bloc.dart';
import 'package:local_food_ordering_app/bloc/favourites_bloc.dart';
import 'package:local_food_ordering_app/presentation/Screens/home/homescreen.dart';
import 'package:local_food_ordering_app/constants/const.dart';
import 'package:local_food_ordering_app/presentation/Screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Ordering App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appBAR),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CartBloc()),
          BlocProvider(create: (_) => FavoritesBloc()),
        ],
        child: Homescreen(),
      ),
    );
  }
}
