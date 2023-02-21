// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/std_mark_controller.dart';
import '../models/std_mark_model.dart';
import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class StdMarksPage extends StatefulWidget {
  StdMarksPage({super.key});

  @override
  State<StdMarksPage> createState() => _StdMarksPageState();
}

class _StdMarksPageState extends State<StdMarksPage> {
  // dependency injection
  StdMarkController stdMarksController = Get.find();

  // to be assigned upon page load
  late List<StdMark> stdList;

  // controller and focus node for the textfield widget
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();

  @override
  void initState() {
    super.initState();
    loadStdMarks();
  }

  loadStdMarks() {
    stdList = stdMarksController.stdMarkList;
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
                child: CustomTextField(
                  hintText: 'Search...',
                  icon: Icons.search,
                  textController: searchController,
                  focusNode: searchNode,
                ),
              ),
              Gap(20),
              Expanded(
                child: ListView.builder(
                  itemCount: stdList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return StdAlertDialog(
                                permitNo: stdList[index].permitNo,
                                title: stdList[index].title,
                                expiryDate: stdList[index].expiryDate,
                                status: stdList[index].status,
                                issueDate: stdList[index].issueDate,
                                address: stdList[index].address,
                                prodBrand: stdList[index].prodBrand,
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
                      title: Text(stdList[index].title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(5),
                          Text(
                            stdList[index].companyName,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Gap(10),
                          stdList[index].status == 'valid'
                              ? Text(
                                  'Valid',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 73, 230, 79)),
                                )
                              : Text(
                                  'Invalid',
                                  style: TextStyle(color: Colors.red),
                                ),
                        ],
                      ),
                    );
                  },
                ),
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
}
