import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home_bg_3.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryBlueColor.withOpacity(.3),
                  Colors.white,
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 30,
            child: Container(
              child: Image(
                image: AssetImage('assets/logo.png'),
                width: 60,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 50,
            child: Container(
              width: 300,
              height: 300,
              child: Carousel(),
            ),
          ),
        ],
      ),
    );
  }
}
