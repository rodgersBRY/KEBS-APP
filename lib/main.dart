// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/bindings.dart';
import './screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KEBS App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: getPages,
    );
  }

  List<GetPage> getPages = [
    GetPage(
      name: '/',
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/home',
      page: () => Homepage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/std-page',
      page: () => SMarksPage(),
      transition: Transition.fade,
      binding: MyBindings(),
    ),
    GetPage(
      name: '/verify-staff',
      page: () => VerifyStaffPage(),
      transition: Transition.fade,
      binding: MyBindings(),
    ),
    GetPage(
      name: '/fortification-mark',
      page: () => FortificationPage(),
      transition: Transition.fade,
      binding: MyBindings(),
    ),
    GetPage(
      name: '/companies',
      page: () => CompaniesPage(),
      transition: Transition.fade,
      binding: MyBindings(),
    ),
    GetPage(
      name: '/diamond-page',
      page: () => DiamondMarkPage(),
      transition: Transition.fade,
      binding: MyBindings(),
    ),
    GetPage(
      name: '/company-details',
      page: () => CompanyDetailsPage(),
      transition: Transition.fade,
      binding: MyBindings(),
    ),
    GetPage(
      name: '/contact',
      page: () => ContactPage(),
      transition: Transition.fade,
    ),
    // GetPage(
    //   name: '/complaints',
    //   page: () => ComplaintsPage(),
    //   transition: Transition.fade,
    // ),
    // GetPage(
    //   name: '/test-page',
    //   page: () => TestVerifyPage(),
    //   transition: Transition.fade,
    // ),
  ];
}
