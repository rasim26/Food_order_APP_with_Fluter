import 'package:flutter/material.dart';
import 'package:local_food_ordering_app/constants/const.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  // final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: 80.0,
      backgroundColor: AppColors.background,
      title: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Deliver now', style: TextStyle(fontSize: 15)),
                  Row(
                    children: [
                      Text(
                        'Your location',
                        style: TextStyle(
                          color: AppColors.keycolor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.expand_more),
                    ],
                  ),
                ],
              ),

              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_rounded,
                      color: AppColors.keycolor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(43.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ).copyWith(bottom: 4.0),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: TextFormField(
              onTap: () {},
              decoration: InputDecoration(
                hintText: 'Search for restaurants, dishes...',
                prefixIcon: Icon(Icons.search, color: AppColors.keycolor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 1.5, color: AppColors.keycolor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120.0);
}
