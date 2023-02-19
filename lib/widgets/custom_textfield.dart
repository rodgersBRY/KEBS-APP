import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode focusNode;
  final String hintText;
  final IconData icon;

  CustomSearchField({
    super.key,
    required this.textController,
    required this.focusNode,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryBlueColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: textController,
        focusNode: focusNode,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
