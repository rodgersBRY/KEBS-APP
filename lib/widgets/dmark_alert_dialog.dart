import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';

class DMarkAlertDialog extends StatelessWidget {
  final String status;
  final String productId;
  final String productName;
  final String physicalAddress;
  final String expiryDate;
  final String issueDate;

  DMarkAlertDialog({
    super.key,
    required this.productId,
    required this.productName,
    required this.physicalAddress,
    required this.expiryDate,
    required this.issueDate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              'assets/std_logo.png',
              height: 60,
            ),
            Gap(10),
            Text(
              productId,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Gap(5),
            Text(
              status,
              style: TextStyle(
                fontSize: 14,
                color: status == 'Valid'
                    ? Color.fromARGB(255, 73, 230, 79)
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * .4,
        width: MediaQuery.of(context).size.height * .9,
        child: Column(
          children: [
            Gap(20),
            Text(
              productName,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                    Text('Product ID: $productId'),
                    Gap(10),
                    Text('Address: ${physicalAddress}'),
                    Gap(10),
                    Text('Issue Date: ${issueDate}'),
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
