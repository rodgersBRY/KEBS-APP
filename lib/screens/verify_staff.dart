import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              child: SizedBox(
                height: 300,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    Carousel(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: CustomToolbar(
                        onPressed: () {},
                        title: '',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(50),
            Text(
              'VERIFY DATA',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomSearchField(
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    staffNoController.dispose();
  }
}
