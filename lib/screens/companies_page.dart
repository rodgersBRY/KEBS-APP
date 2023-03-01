import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebs_app/utils/app_colors.dart';
import 'package:kebs_app/widgets/widgets.dart';

import '../controllers/companies_controller.dart';
import '../models/companies_model.dart';

class CompaniesPage extends StatefulWidget {
  const CompaniesPage({super.key});

  @override
  State<CompaniesPage> createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  late Future companiesFuture;
  CompaniesController companiesController = Get.find();

  @override
  initState() {
    companiesFuture = companiesController.fetchCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlueColor,
          title: Text('Companies'),
        ),
        body: FutureBuilder(
            future: companiesFuture,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(child: CustomErrorWidget());
                  }
                  return Center(child: Text(snapshot.data.length));
              }
            }),
      ),
    );
  }
}
