import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kebs_app/utils/app_colors.dart';

class MarkDetailsPage extends StatelessWidget {
  const MarkDetailsPage({
    super.key,
  });

  String formatDate(String date) {
    return DateFormat.yMMMMd().format(DateTime.parse(date));
  }

  @override
  Widget build(BuildContext context) {
    final String imagePath = Get.arguments['imagePath'];
    final bool status = Get.arguments['status'];
    final markArg = Get.arguments['mark'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Product Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Gap(30),
              SizedBox(
                height: 90,
                width: 90,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              Gap(10),
              Text(
                markArg.productId,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Gap(5),
              Text(
                markArg.productName,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(10),
              Text(
                status ? "Valid" : "Expired",
                style: TextStyle(
                  color: status
                      ? AppColors.validGreenColor
                      : AppColors.expiredRedColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(40),
              const Divider(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                child: Row(
                  children: [
                    Text(
                      'Standard Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Permit No: ${markArg.productId}',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                        Gap(5),
                        Text(
                          'Product Name: ${markArg.productName}',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                        Gap(10),
                        Text(
                          'Product Brand: ${markArg.productBrand}',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                        Gap(10),
                        Text(
                          'Company Name: ${markArg.companyName}',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                        Gap(10),
                        Text(
                          "Physical Address: ${markArg.physicalAddress}",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                        Gap(30),
                        Text(
                          'Issue Date: ${formatDate(markArg.issueDate)}',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                        Gap(10),
                        Text(
                          'Expiry Date: ${formatDate(markArg.expiryDate)}',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                        Gap(10),
                        Text(
                          'Standard Title: ${markArg.ksTitle}',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                        Gap(10),
                        Text(
                          'Standard Ref: ${markArg.ksNo}',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
