import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class VerifyStaffPage extends StatefulWidget {
  VerifyStaffPage({super.key});

  @override
  State<VerifyStaffPage> createState() => _VerifyStaffPageState();
}

class _VerifyStaffPageState extends State<VerifyStaffPage> {
  TextEditingController staffNoController = TextEditingController();
  FocusNode staffNoFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        staffNoFocusNode.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Verify Staff"),
            backgroundColor: AppColors.primaryBlueColor,
          ),
          body: Column(
            children: [
              Gap(150),
              Text(
                'VERIFY STAFF',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextField(
                  hintText: 'Staff No or ID Number',
                  icon: Icons.verified_user,
                  textController: staffNoController,
                  focusNode: staffNoFocusNode,
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
    staffNoController.dispose();
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
          'Verify Staff',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
