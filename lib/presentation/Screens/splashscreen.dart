import 'package:flutter/material.dart';
import 'package:local_food_ordering_app/constants/const.dart';
import 'package:local_food_ordering_app/presentation/Auth/auth.dart';
import 'package:local_food_ordering_app/presentation/Screens/home/homescreen.dart';
import 'package:local_food_ordering_app/widget/main_title.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Yumm App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.keycolor,
                    fontStyle: FontStyle.italic,
                    fontSize: 50,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homescreen(),
                            ),
                          );
                        });
                      },
                      child: Text(
                        'Continue without Login',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
