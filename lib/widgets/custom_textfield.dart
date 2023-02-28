import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode focusNode;
  final String hintText;
  // final VoidCallback onChanged;

  CustomTextField({
    super.key,
    required this.textController,
    required this.focusNode,
    required this.hintText,
    // required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: AppColors.primaryBlueColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        // onChanged: onChanged(),
        controller: textController,
        focusNode: focusNode,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
