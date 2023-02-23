// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_colors.dart';
import '../widgets/gradient_background.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  List _quickActions = [
    {
      "title": "Standardization Mark",
      "icon": "assets/std_logo.png",
      "route": "/std-page"
    },
    {
      "title": "Diamond Mark",
      "icon": "assets/diamond_logo.png",
      "route": "/diamond-page"
    },
    {
      "title": "Fortification Mark",
      "icon": "assets/fortification_logo.png",
      "route": "/fortification-mark"
    },
    {
      "title": "Verify KEBS Staff",
      "icon": "assets/verify_icon.png",
      "route": "/verify-staff"
    },
    {
      "title": "Test Results",
      "icon": "assets/testing_icon.png",
      "route": "/test-page"
    },
    {"title": "Complaints", "icon": "assets/complaints_icon.png", "route": "/"},
    {
      "title": "Companies",
      "icon": "assets/companies_icon.png",
      "route": "/companies"
    },
    {
      "title": "Contact Us",
      "icon": "assets/contact_icon.png",
      "route": "/contact"
    },
  ];

  _redirectToWebstore() async {
    const url = 'https://webstore.kebs.org';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('cannot launch the url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GradientBackground(),
          const Gap(15),
          Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: _quickActions.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(_quickActions[index]['route']);
                    },
                    child: Container(
                      height: 120,
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryBlueColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            _quickActions[index]['icon'],
                            height: 60,
                            width: 60,
                          ),
                          Gap(5),
                          FittedBox(
                            child: Text(
                              _quickActions[index]['title'],
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: _redirectToWebstore,
        child: Container(
          padding: EdgeInsets.all(10),
          width: 150,
          decoration: BoxDecoration(
            color: AppColors.primaryBlueColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              Gap(5),
              Text(
                "Buy Standards",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
