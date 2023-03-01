import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kebs_app/models/companies_model.dart';
import 'package:kebs_app/models/marks_model.dart';

import '../controllers/companies_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class CompaniesPage extends StatefulWidget {
  const CompaniesPage({super.key});

  @override
  State<CompaniesPage> createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  late Future<List<Company>> companiesFuture;
  CompaniesController companiesController = Get.find();

  TextEditingController _searchController = new TextEditingController();
  FocusNode _searchNode = new FocusNode();

  String _searchQuery = '';

  @override
  initState() {
    companiesFuture = companiesController.fetchCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          _searchNode.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryBlueColor,
            title: Text('Companies'),
          ),
          body: Column(
            children: [
              Gap(20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlueColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        _searchQuery = val;
                      });
                    },
                    controller: _searchController,
                    focusNode: _searchNode,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Company Name',
                      hintStyle: TextStyle(fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              FutureBuilder<List<Company>>(
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
                        } else {
                          List<Company> data = snapshot.data!;

                          if (_searchQuery.isNotEmpty) {
                            data = data.where((cp) =>
                                cp.companyName
                                    .toLowerCase()
                                    .contains(_searchQuery.toLowerCase())).toList();
                          }
                          return Expanded(
                            child: _buildListView(context, data),
                          );
                        }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView(context, data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              onTap: () {
                Get.toNamed(
                  '/company-details',
                  arguments: {'companyName': data[index].companyName},
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
              title: Text("${data[index].companyName}"),
            ),
          );
        },
      ),
    );
  }
}
