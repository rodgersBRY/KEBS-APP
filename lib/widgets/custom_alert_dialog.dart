import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../utils/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String imagePath;
  final bool status;
  final String productId;
  final String productName;
  final String expiryDate;
  final String issueDate;
  final String companyName;
  final String productBrand;
  final String ksTitle;
  final String ksNo;

  CustomAlertDialog({
    super.key,
    required this.productId,
    required this.productName,
    required this.expiryDate,
    required this.issueDate,
    required this.status,
    required this.imagePath,
    required this.companyName,
    required this.productBrand,
    required this.ksTitle,
    required this.ksNo,
  });

  String formatDate(String date) {
    return DateFormat.yMMMMd().format(DateTime.parse(date));
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 60,
            ),
            Gap(10),
            Text(
              productName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(10),
            Text(
              'Permit No: $productId',
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
        width: MediaQuery.of(context).size.height * .9,
        child: Column(
          children: [
            Gap(20),
            Expanded(
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlueColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Product Information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(10),
                    Text("Company Name: $companyName"),
                    Gap(10),
                    Text('Product Brand: $productBrand'),
                    Gap(10),
                    Text('Permit No: $productId'),
                    Gap(10),
                    Text('Issue Date: ${formatDate(issueDate)}'),
                    Gap(10),
                    Text("Expiry Date: ${formatDate(expiryDate)}"),
                    Gap(10),
                    Text('Standard Title: $ksTitle'),
                    Gap(10),
                    Text('Standard Ref: $ksNo'),
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