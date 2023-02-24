import 'package:flutter/material.dart';
import 'package:kebs_app/utils/app_colors.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlueColor,
          title: Text('Companies'),
        ),
        body: Center(child: Text("Companies Page")),
      ),
    );
  }
}
