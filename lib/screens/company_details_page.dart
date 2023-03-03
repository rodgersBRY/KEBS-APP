// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/company_details_controller.dart';
import '../utils/app_colors.dart';

class CompanyDetailsPage extends StatefulWidget {
  CompanyDetailsPage({super.key});

  @override
  State<CompanyDetailsPage> createState() => _CompanyDetailsPageState();
}

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  CompanyDetailsController companyDetailsController = Get.find();
  late Future detailsController;

  String companyName = Get.arguments['companyName'];

  @override
  void initState() {
    detailsController = companyDetailsController.getCompanyDetails(companyName);
    super.initState();
  }

  bool confirmValidity(String? expiryDate) {
    if (expiryDate != "null") {
      DateTime today = DateTime.now();
      DateTime date = DateTime.parse(expiryDate!);

      return date.isAfter(today);
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text(companyName)),
        backgroundColor: AppColors.primaryBlueColor,
      ),
      body: FutureBuilder(
        future: detailsController,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_sharp,
                        color: Colors.grey[300],
                        size: 80,
                      ),
                      Gap(20),
                      Text(
                        'Missing Information about this company',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.data.length != 0) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      color: Colors.grey[200],
                      child: Text(
                        'Acquired Marks',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: _buildListView(context, snapshot.data)),
                  ],
                );
              }
              return Center(
                child: Text(
                  "No registered marks",
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
          }
        },
      ),
    );
  }

  Widget _buildListView(context, data) {
    return ListView.separated(
        itemCount: data.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return _buildAlertDialog(
                        status: confirmValidity(data[index]['expiry_date']),
                        productName: data[index]['product_name'],
                        productId: data[index]['product_id'],
                        expiryDate: data[index]['expiry_date'],
                        issueDate: data[index]['issue_date'],
                        physicalAddress: data[index]['physical_address'],
                      );
                    });
              },
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              title: Text(data[index]['companyName']),
              subtitle: Text(
                data[index]['product_name'],
                style: TextStyle(color: Colors.grey),
              ),
              trailing: confirmValidity(data[index]['expiry_date'])
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
            ),
          );
        });
  }

  AlertDialog _buildAlertDialog({
    required bool status,
    required String productName,
    required String productId,
    required String expiryDate,
    required String issueDate,
    required String physicalAddress,
  }) {
    return AlertDialog(
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              productName,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(10),
            Text(
              "Permit No: $productId",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Gap(5),
            Text(
              status ? "Valid" : "Expired",
              style: TextStyle(
                fontSize: 14,
                color: status ? Color.fromARGB(255, 73, 230, 79) : Colors.red,
              ),
            ),
          ],
        ),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).size.height * .9,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlueColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Permit No: $productId'),
                    Gap(10),
                    Text('Physical Address: ${physicalAddress}'),
                    Gap(10),
                    Text('Date Issued: ${issueDate}'),
                    Gap(10),
                    Text('Expiry Date: ${expiryDate}'),
                    Gap(10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
