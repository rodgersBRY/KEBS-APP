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
    final String detailsTitle = Get.arguments['detailsTitle'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
              const Gap(10),
              SizedBox(
                height: 90,
                width: 90,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              const Gap(10),
              Text(
                markArg.productId,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const Gap(5),
              Text(
                markArg.productName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
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
              const Gap(20),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                    color: AppColors.primaryBlueColor.withOpacity(.1),
                    border: Border.symmetric(
                        horizontal: BorderSide(
                      color: Colors.grey[300]!,
                    ))),
                child: Text(
                  detailsTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: AppColors.primaryBlueColor.withOpacity(.1),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _builtText('Permit No: ${markArg.productId}'),
                        const Gap(5),
                        _builtText('Product Name: ${markArg.productName}'),
                        const Gap(10),
                        _builtText('Product Brand: ${markArg.productBrand}'),
                        const Gap(10),
                        _builtText('Company Name: ${markArg.companyName}'),
                        const Gap(30),
                        _builtText(
                            'Issue Date: ${formatDate(markArg.issueDate)}'),
                        const Gap(10),
                        _builtText(
                            'Expiry Date: ${formatDate(markArg.expiryDate)}'),
                        const Gap(10),
                        markArg.ksNo != ''
                            ? _builtText('Standard Ref: ${markArg.ksNo}')
                            : Container(),
                        const Gap(10),
                        markArg.ksTitle != ''
                            ? _builtText('Standard Title: ${markArg.ksTitle}')
                            : Container(),
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

  Text _builtText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 22, color: Colors.grey[800]),
    );
  }
}
