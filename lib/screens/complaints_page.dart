import 'package:flutter/material.dart';
import 'package:kebs_app/utils/app_colors.dart';

class ComplaintsPage extends StatefulWidget {
  const ComplaintsPage({super.key});

  @override
  State<ComplaintsPage> createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('File a Complaint'),
          backgroundColor: AppColors.primaryBlueColor,
        ),
        body: Container(
          child: Text('Complaining nonstop'),
        ),
      ),
    );
  }
}
