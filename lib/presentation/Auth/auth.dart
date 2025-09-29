import 'package:flutter/material.dart';
import 'package:local_food_ordering_app/widget/main_title.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: MainTitle(title: 'Login'),
            ),
          ],
        ),
      ),
    );
  }
}
