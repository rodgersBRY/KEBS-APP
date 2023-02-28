// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/s_mark_controller.dart';
import '../models/s_mark_model.dart';
import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class SMarksPage extends StatefulWidget {
  SMarksPage({super.key});

  @override
  State<SMarksPage> createState() => _SMarksPageState();
}

class _SMarksPageState extends State<SMarksPage> {
  // dependency injection
  SMarkController stdMarksController = Get.find();

  // to be assigned upon page load
  late Future<List<SMark>> stdMrkBuilder;

  // controller and focus node for the textfield widget
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    stdMrkBuilder = stdMarksController.fetchSMarks();
  }

  bool confirmValidity(String expiryDate) {
    DateTime today = DateTime.now();
    DateTime date = DateTime.parse(expiryDate);

    return date.isAfter(today);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          searchNode.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryBlueColor,
            title: Text('Standardization Marks'),
          ),
          body: Column(
            children: [
              Gap(20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
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
                    controller: searchController,
                    focusNode: searchNode,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Gap(20),
              Expanded(
                child: FutureBuilder<List<SMark>>(
                    future: stdMrkBuilder,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return CustomErrorWidget();
                          } else {
                            List<SMark> data = snapshot.data!;

                            if (_searchQuery.isNotEmpty) {
                              data = data
                                  .where((std) =>
                                          // std.productId!.toLowerCase().contains(
                                          //     _searchQuery.toLowerCase()) ||
                                          std.companyName
                                              .toLowerCase()
                                              .contains(
                                                  _searchQuery.toLowerCase())
                                      //     ||
                                      // std.productBrand!
                                      //     .toLowerCase()
                                      //     .contains(_searchQuery.toLowerCase())
                                      )
                                  .toList();
                            }
                            return _createListView(context, data);
                          }
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  ListView _createListView(BuildContext context, List<SMark> data) {
    List<SMark> stdMarks = data;

    return ListView.builder(
      itemCount: stdMarks.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return StdAlertDialog(
                    status: confirmValidity(stdMarks[index].expiryDate),
                    permitNo: stdMarks[index].productId!,
                    title: stdMarks[index].productName,
                    expiryDate: stdMarks[index].expiryDate,
                    issueDate: stdMarks[index].issueDate,
                    address: stdMarks[index].physicalAddress!,
                    prodBrand: stdMarks[index].productBrand!,
                  );
                });
          },
          splashColor: AppColors.primaryBlueColor.withOpacity(.3),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
          leading: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/std_logo.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          title: Text(stdMarks[index].productName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(5),
              Text(
                stdMarks[index].companyName,
                style: TextStyle(color: Colors.grey),
              ),
              Gap(10),
              confirmValidity(stdMarks[index].expiryDate)
                  ? Text(
                      "Valid",
                      style: TextStyle(
                        color: AppColors.validGreenColor,
                      ),
                    )
                  : Text(
                      "Expired",
                      style: TextStyle(
                        color: AppColors.expiredRedColor,
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
