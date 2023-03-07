import 'package:flutter/material.dart';

import './custom_alert_dialog.dart';
import '../models/marks_model.dart';
import '../utils/app_colors.dart';

class CustomListView extends StatelessWidget {
  final List<MarkModel> marks;

  const CustomListView({super.key, required this.marks});

  bool confirmValidity(String expiryDate) {
    DateTime today = DateTime.now();
    DateTime date = DateTime.parse(expiryDate);

    return date.isAfter(today);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: ((context, index) {
        return Divider();
      }),
      itemCount: marks.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                    imagePath: 'assets/smark_logo.png',
                    status: confirmValidity(marks[index].expiryDate.toString()),
                    productId: marks[index].productId,
                    productName: marks[index].productName,
                    expiryDate: marks[index].expiryDate.toString(),
                    issueDate: marks[index].issueDate.toString(),
                    productBrand: marks[index].productBrand,
                    ksTitle: marks[index].ksTitle,
                    ksNo: marks[index].ksNo,
                    companyName: marks[index].companyName,
                  );
                });
          },
          splashColor: AppColors.primaryBlueColor.withOpacity(.3),
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          leading: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/smark_logo.png'),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          title: Text(marks[index].productName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                marks[index].companyName,
                style: const TextStyle(color: Colors.grey),
              ),
              confirmValidity(marks[index].expiryDate)
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
