import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/marks_model.dart';
import '../utils/app_colors.dart';

class CustomListView extends StatelessWidget {
  final List<MarkModel> marks;
  final String imagePath;
  final String detailsTitle;

  const CustomListView({
    super.key,
    required this.marks,
    required this.imagePath,
    required this.detailsTitle,
  });

  bool confirmValidity(String expiryDate) {
    DateTime today = DateTime.now();
    DateTime date = DateTime.parse(expiryDate);

    return date.isAfter(today);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: ((context, index) {
        return const Divider();
      }),
      itemCount: marks.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Get.toNamed(
              '/mark-details-page',
              arguments: {
                'detailsTitle': detailsTitle,
                'mark': marks[index],
                'imagePath': imagePath,
                "status": confirmValidity(marks[index].expiryDate.toString()),
              },
            );
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
