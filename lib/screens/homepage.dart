// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/companies_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/gradient_background.dart';
import '../widgets/online_links_widget.dart';

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
      "title": "Verify KEBS Staff",
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
      "title": "Certified\nCompanies/Firms",
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
    return Scaffold(
      body: Column(
        children: [
          GradientBackground(),
          const Gap(10),
          Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                          height: 50,
                          width: 50,
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
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: OnlineLinks(
              onTap: _applyForSMark,
              title: 'Apply for Standardization Mark',
            ),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: OnlineLinks(
              onTap: _redirectToWebstore,
              title: "Buy Kenyan Standards",
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
