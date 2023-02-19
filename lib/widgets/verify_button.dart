import 'package:flutter/material.dart';
import 'package:kebs_app/utils/app_colors.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.blue.withOpacity(.4),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 70,
        width: 250,
        decoration: BoxDecoration(
          color: AppColors.primaryBlueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          'Verify Staff',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
