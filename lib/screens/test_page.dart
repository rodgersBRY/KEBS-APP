import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class TestVerifyPage extends StatefulWidget {
  const TestVerifyPage({super.key});

  @override
  State<TestVerifyPage> createState() => _TestVerifyPageState();
}

class _TestVerifyPageState extends State<TestVerifyPage> {
  TextEditingController bsNoController = TextEditingController();
  FocusNode bsNoFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bsNoFocusNode.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: CustomToolbar(
                  onPressed: () {
                    Get.offAllNamed('/home');
                  },
                  title: '',
                ),
              ),
              Gap(150),
              Text(
                'Test Results Checker',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlueColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    // onChanged: onChanged(),
                    controller: bsNoController,
                    focusNode: bsNoFocusNode,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "BS Number",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Gap(50),
              VerifyButton()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bsNoController.dispose();
  }
}

class VerifyButton extends StatelessWidget {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.blue.withOpacity(.4),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 70,
        width: 250,
        decoration: BoxDecoration(
          color: AppColors.primaryBlueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          'Submit',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
