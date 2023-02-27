import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kebs_app/utils/app_colors.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Contact Details'),
          backgroundColor: AppColors.primaryBlueColor,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Managing Director',
                style: TextStyle(fontSize: 17),
              ),
              Gap(10),
              Text(
                'Kenya Bureau of Standards',
                style: TextStyle(fontSize: 17),
              ),
              Gap(40),
              Text(
                'Popo road, Off Mombasa Road',
                style: TextStyle(fontSize: 17),
              ),
              Gap(10),
              Text(
                'P.O Box 54974 - 00200',
                style: TextStyle(fontSize: 17),
              ),
              Gap(10),
              Text(
                'Nairobi, Kenya',
                style: TextStyle(fontSize: 17),
              ),
              Gap(40),
              Text(
                'Tel: +254(20) 694 8000',
                style: TextStyle(fontSize: 17),
              ),
              Gap(10),
              Text(
                'Mobile: 0722202137 or 0734600471/2',
                style: TextStyle(fontSize: 17),
              ),
              Gap(10),
              Text(
                'PVOC: 0724255242',
                style: TextStyle(fontSize: 17),
              ),
              Gap(10),
              Text(
                'Email: info@kebs.org',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
