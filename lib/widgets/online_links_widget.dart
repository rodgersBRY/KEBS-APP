
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class OnlineLinks extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const OnlineLinks({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 70,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.primaryBlueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
