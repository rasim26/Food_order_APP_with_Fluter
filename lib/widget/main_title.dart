import 'package:flutter/material.dart';
import 'package:local_food_ordering_app/constants/const.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
        color: AppColors.keycolor,
      ),
    );
  }
}
