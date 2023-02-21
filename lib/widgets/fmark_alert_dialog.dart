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

  FMarkAlertDialog({
    super.key,
    required this.title,
    this.ksNo,
    required this.prodBrand,
    required this.address,
    required this.expiryDate,
    required this.issueDate,
    required this.prodId,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
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
            Text(
              'Valid',
              style: TextStyle(color: Color.fromARGB(255, 73, 230, 79)),
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlueColor.withOpacity(.2),
                  border: Border.all(color: Colors.grey),
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
