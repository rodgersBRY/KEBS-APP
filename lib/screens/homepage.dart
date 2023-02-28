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
      "title": "Verify\nStandardization Mark",
      "icon": "assets/std_logo.png",
      "route": "/std-page"
    },
    {
      "title": "Verify\nDiamond Mark",
      "icon": "assets/diamond_logo.png",
      "route": "/diamond-page"
    },
    {
      "title": "Verify\nFortification Mark",
      "icon": "assets/fortification_logo.png",
      "route": "/fortification-mark"
    },
    {
      "title": "Verify Staff",
      "icon": "assets/verify_icon.png",
      "route": "/verify-staff"
    },
    // {
    //   "title": "Test Results",
    //   "icon": "assets/testing_icon.png",
    //   "route": "/test-page"
    // },
    // {
    //   "title": "Complaints",
    //   "icon": "assets/complaints_icon.png",
    //   "route": "/complaints"
    // },
    {
      "title": "Certified\nCompanies",
      "icon": "assets/companies_icon.png",
      "route": "/companies"
    },
    {
      "title": "Contact Us",
      "icon": "assets/contact_icon.png",
      "route": "/contact"
    },
  ];

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
          Container(
            height: 320,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GridView.builder(
              itemCount: _quickActions.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 18.0,
                mainAxisSpacing: 18.0,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(_quickActions[index]['route']);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryBlueColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
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
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: OnlineLinks(),
            ),
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 20.0),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage('assets/wajibika.jpeg'),
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class OnlineLinks extends StatelessWidget {
  const OnlineLinks({super.key});

  _redirectToWebstore() async {
    const url = 'https://webstore.kebs.org/';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('cannot launch the url $url');
    }
  }

  _applyForSMark() async {
    const url = 'https://kims.kebs.org/';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('cannot launch the url $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: _applyForSMark,
          child: Container(
            padding: EdgeInsets.all(10),
            // width: 150,
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
                  "Standardization Mark",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
        ),
        Gap(20),
        GestureDetector(
          onTap: _redirectToWebstore,
          child: Container(
            padding: EdgeInsets.all(10),
            // width: 150,
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
                  "Kenyan Standards",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
