// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/staff_verify_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class VerifyStaffPage extends StatefulWidget {
  const VerifyStaffPage({super.key});

  @override
  State<VerifyStaffPage> createState() => _VerifyStaffPageState();
}

class _VerifyStaffPageState extends State<VerifyStaffPage> {
  Future _staffInfo = Future.value(null);

  VerifyStaffController verifyStaffController = Get.find();
  TextEditingController staffNoController = TextEditingController();
  FocusNode staffNoFocusNode = FocusNode();

  void _verifyStaff() {
    var staffNo = staffNoController.text.trim();
    setState(() {
      _staffInfo = verifyStaffController.verifyStaff(staffNo);
    });

    staffNoController.clear();
    staffNoFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        staffNoFocusNode.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Verify Staff"),
            backgroundColor: AppColors.primaryBlueColor,
          ),
          body: Column(
            children: [
              const Gap(100),
              const Text(
                'VERIFY STAFF',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextField(
                  hintText: 'Staff Number or HR Number',
                  textController: staffNoController,
                  focusNode: staffNoFocusNode,
                ),
              ),
              const Gap(50),
              InkWell(
                onTap: _verifyStaff,
                splashColor: Colors.blue.withOpacity(.4),
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(
                      () => Center(
                        child: verifyStaffController.loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Verify',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    )),
              ),
              const Gap(45),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(20),
                  child: FutureBuilder(
                      future: _staffInfo,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                          default:
                            if (snapshot.hasError) {
                              return const Expanded(
                                  child: Text(
                                'Hello World',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 24,
                                ),
                              ));
                            } else if (!snapshot.hasData) {
                              return Center(
                                child: Text(
                                  'Staff Info will appear here',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "HR No: ${snapshot.data[0].hrno}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: snapshot.data[0].status == "ACTIVE"
                                          ? Colors.grey[700]
                                          : AppColors.expiredRedColor,
                                    ),
                                  ),
                                  const Gap(15),
                                  Text(
                                    "Last Name: ${snapshot.data[0].firstname}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: snapshot.data[0].status == "ACTIVE"
                                          ? Colors.grey[700]
                                          : AppColors.expiredRedColor,
                                    ),
                                  ),
                                  const Gap(15),
                                  Text(
                                    "Middle Name: ${snapshot.data[0].middlename}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: snapshot.data[0].status == "ACTIVE"
                                          ? Colors.grey[700]
                                          : AppColors.expiredRedColor,
                                    ),
                                  ),
                                  const Gap(15),
                                  Text(
                                    "Last Name: ${snapshot.data[0].lastname}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: snapshot.data[0].status == "ACTIVE"
                                          ? Colors.grey[700]
                                          : AppColors.expiredRedColor,
                                    ),
                                  ),
                                  const Gap(15),
                                  Text(
                                    "Position: ${snapshot.data[0].position}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: snapshot.data[0].status == "ACTIVE"
                                          ? Colors.grey[700]
                                          : AppColors.expiredRedColor,
                                    ),
                                  ),
                                  const Gap(15),
                                  Text(
                                    "Status: ${snapshot.data[0].status}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: snapshot.data[0].status == "ACTIVE"
                                          ? AppColors.validGreenColor
                                          : AppColors.expiredRedColor,
                                    ),
                                  ),
                                ],
                              );
                            }
                        }
                      }),
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
    staffNoController.dispose();
  }
}
