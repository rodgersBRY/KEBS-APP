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

  late Future<List<FMark>> fortificationBuilder;

  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();

  @override
  void initState() {
    super.initState();

    fortificationBuilder = _fMarkController.fetchFMarks();
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
                child: FutureBuilder<List<FMark>>(
                    future: fortificationBuilder,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: new CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return new Text('Error: ${snapshot.error}');
                          } else {
                            return _createListView(context, snapshot);
                          }
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _createListView(
    BuildContext context, AsyncSnapshot<List<FMark>> snapshot) {
  List<FMark> fMarks = snapshot.data!;

  return ListView.builder(
    itemCount: fMarks.length,
    itemBuilder: (context, index) {
      return ListTile(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return FMarkAlertDialog(
                  prodId: fMarks[index].productId,
                  title: fMarks[index].productName,
                  expiryDate: fMarks[index].expiryDate,
                  issueDate: fMarks[index].issueDate,
                  address: fMarks[index].physicalAddress!,
                  prodBrand: fMarks[index].productBrand,
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
        title: Text(fMarks[index].productName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(5),
            Text(
              fMarks[index].companyName,
              style: TextStyle(color: Colors.grey),
            ),
            Gap(10),
            Text(
              fMarks[index].productBrand,
              style: TextStyle(color: Color.fromARGB(255, 73, 230, 79)),
            )
          ],
        ),
      );
    },
  );
}
