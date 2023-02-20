import 'package:flutter/material.dart';
import 'package:kebs_app/utils/app_colors.dart';
import 'package:kebs_app/widgets/widgets.dart';

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
          Carousel(),
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
            top: 50,
            left: 20,
            child: Container(
              width: 60,
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
