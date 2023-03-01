import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/companies_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

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
                  return _buildListView(context, snapshot.data);
              }
            }),
      ),
    );
  }

  Widget _buildListView(context, data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        // TODO: change incase you need to
        itemCount: 100,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              onTap: () {
                Get.toNamed(
                  '/company-details',
                  arguments: {'companyName': data[index]['companyName']},
                );
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue[200],
                child: Center(
                  child: Text(
                    '#${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              title: Text(data[index]['companyName']),
            ),
          );
        },
      ),
    );
  }
}
