import 'package:flutter/material.dart';
import 'package:local_food_ordering_app/constants/const.dart';
import 'package:local_food_ordering_app/data/repository/list_food.dart';
import 'package:local_food_ordering_app/widget/main_title.dart';
import 'package:local_food_ordering_app/widget/home_food_card.dart';

class HomeArea extends StatelessWidget {
  const HomeArea({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              H.constHeight,
              MainTitle(title: "Recommended for you"),
              H.constHeight,
              LimitedBox(
                maxHeight: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedFoodItems.length,
                  itemBuilder: (context, index) {
                    return HomeFoodCard(
                      imagePaths: recommendedFoodItems,
                      foodNames: recommendedFoodNames,
                      foodPrices: recommendedFoodPrices,
                      index: index,
                    );
                  },
                ),
              ),
              MainTitle(title: "Chai \& Snacks"),
              H.constHeight,
              LimitedBox(
                maxHeight: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: streetFoods.length,
                  itemBuilder: (context, index) {
                    return HomeFoodCard(
                      imagePaths: streetFoods,
                      index: index,
                      foodNames: streetFoodNames,
                      foodPrices: streetFoodPrices,
                    );
                  },
                ),
              ),
              MainTitle(title: "Desserts"),
              H.constHeight,
              LimitedBox(
                maxHeight: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dessertFoodItems.length,
                  itemBuilder: (context, index) {
                    return HomeFoodCard(
                      imagePaths: dessertFoodItems,
                      index: index,
                      foodNames: dessertNames,
                      foodPrices: dessertPrices,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
