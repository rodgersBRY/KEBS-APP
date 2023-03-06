import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kebs_app/utils/app_colors.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 215, 231, 245),
        appBar: AppBar(
          elevation: 0,
          title: const Text('Contact Details'),
          backgroundColor: AppColors.primaryBlueColor,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Managing Director',
                style: TextStyle(fontSize: 17),
              ),
              const Gap(10),
              const Text(
                'Kenya Bureau of Standards',
                style: TextStyle(fontSize: 17),
              ),
              const Gap(40),
              const Text(
                'Popo road, Off Mombasa Road',
                style: TextStyle(fontSize: 17),
              ),
              const Gap(10),
              const Text(
                'P.O Box 54974 - 00200',
                style: TextStyle(fontSize: 17),
              ),
              const Gap(10),
              const Text(
                'Nairobi, Kenya',
                style: TextStyle(fontSize: 17),
              ),
              const Gap(40),
              const Text(
                'Tel: +254(20) 694 8000',
                style: TextStyle(fontSize: 17),
              ),
              const Gap(10),
              const Text(
                'Mobile: 0722202137 or 0734600471/2',
                style: TextStyle(fontSize: 17),
              ),
              const Gap(10),
              const Text(
                'Email: info@kebs.org',
                style: TextStyle(fontSize: 17),
              ),
              const Gap(40),
              const Text(
                'PVOC: 0724255242',
                style: TextStyle(fontSize: 17),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/toll_image.jpeg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
