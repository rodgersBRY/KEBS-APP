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
      transition: Transition.downToUp,
    ),
    GetPage(
      name: '/home',
      page: () => Homepage(),
      transition: Transition.fadeIn,
      binding: MyBindings(),
    ),
    GetPage(
      name: '/std-page',
      page: () => StdMarksPage(),
      transition: Transition.downToUp,
      binding: MyBindings(),
    ),
    GetPage(
      name: '/verify-staff',
      page: () => VerifyStaffPage(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: '/fortification-mark',
      page: () => FortificationPage(),
      transition: Transition.downToUp,
      binding: MyBindings(),
    ),
    GetPage(
      name: '/companies',
      page: () => CompaniesPage(),
      transition: Transition.downToUp,
      binding: MyBindings(),
    ),
    GetPage(
      name: '/diamond-page',
      page: () => DiamondMarkPage(),
      transition: Transition.downToUp,
      binding: MyBindings(),
    ),
  ];
}
