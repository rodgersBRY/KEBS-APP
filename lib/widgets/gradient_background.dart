import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/monument.jpeg'),
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
                  Colors.white.withOpacity(.9),
                ],
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 20,
            child: Container(
              child: Image(
                image: AssetImage('assets/logo.png'),
                width: 60,
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 55,
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
