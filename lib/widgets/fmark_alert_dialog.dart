import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';

class FMarkAlertDialog extends StatelessWidget {
  final String title;
  final int? ksNo;
  final String prodBrand;
  final String prodId;
  final String address;
  final String expiryDate;
  final String issueDate;
  final bool status;

  FMarkAlertDialog({
    super.key,
    required this.title,
    this.ksNo,
    required this.prodBrand,
    required this.address,
    required this.expiryDate,
    required this.issueDate,
    required this.prodId,
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
              prodId,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * .4,
        width: MediaQuery.of(context).size.height * .9,
        child: Column(
          children: [
            status == true
                ? Text(
                    'Valid',
                    style: TextStyle(color: AppColors.validGreenColor),
                  )
                : Text(
                    'Expired',
                    style: TextStyle(color: AppColors.expiredRedColor),
                  ),
            Gap(20),
            Text(
              title,
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
                    ksNo != null ? Text('Ks No: ${ksNo}') : Text('Ks No: '),
                    Gap(10),
                    Text('Address: ${address}'),
                    Gap(10),
                    Text('Product Brand: $prodBrand'),
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
