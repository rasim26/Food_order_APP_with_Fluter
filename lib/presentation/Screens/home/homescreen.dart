import 'package:flutter/material.dart';
import 'package:local_food_ordering_app/widget/bottom_nav_bar.dart';
import 'package:local_food_ordering_app/presentation/Screens/home/home_area.dart';
import 'package:local_food_ordering_app/widget/main_app_bar.dart';

class Homescreen extends StatefulWidget  {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: HomeArea(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
