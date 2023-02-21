import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kebs_app/controllers/f_mark_controller.dart';
import 'package:kebs_app/models/fortification_mark_model.dart';
import 'package:kebs_app/widgets/fmark_alert_dialog.dart';

import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class FortificationPage extends StatefulWidget {
  const FortificationPage({super.key});

  @override
  State<FortificationPage> createState() => _FortificationPageState();
}

class _FortificationPageState extends State<FortificationPage> {
  FMarkController _fMarkController = Get.find();

  late List<FMark> fMarksList;

  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();

  @override
  void initState() {
    super.initState();
    loadFMarks();
  }

  loadFMarks() {
    fMarksList = _fMarkController.fMarks;
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
            title: Text('Fortification Marks'),
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
                  itemCount: fMarksList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return FMarkAlertDialog(
                                prodId: fMarksList[index].productId,
                                title: fMarksList[index].productName,
                                expiryDate: fMarksList[index].expiryDate,
                                issueDate: fMarksList[index].issueDate,
                                address: fMarksList[index].physicalAddress,
                                prodBrand: fMarksList[index].productBrand,
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
                            image: AssetImage('assets/fortification_logo.png'),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      title: Text(fMarksList[index].productName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(5),
                          Text(
                            fMarksList[index].companyName,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Gap(10),
                          Text(
                            fMarksList[index].companyName,
                            style: TextStyle(
                                color: Color.fromARGB(255, 73, 230, 79)),
                          )
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
}
