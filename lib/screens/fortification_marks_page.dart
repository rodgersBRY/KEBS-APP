import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/f_mark_controller.dart';
import '../models/fortification_mark_model.dart';
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

  String _searchQuery = "";

  @override
  void initState() {
    super.initState();

    fortificationBuilder = _fMarkController.fetchFMarks();
  }

  bool confirmValidity(String expiryDate) {
    DateTime today = DateTime.now();
    DateTime date = DateTime.parse(expiryDate);

    return date.isAfter(today);
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
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlueColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          _searchQuery = val;
                        });
                      },
                      controller: searchController,
                      focusNode: searchNode,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  )),
              Gap(20),
              Expanded(
                child: FutureBuilder<List<FMark>>(
                    future: fortificationBuilder,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return CustomErrorWidget();
                          } else {
                            List<FMark> data = snapshot.data!;

                            if (_searchQuery.isNotEmpty) {
                              data = data
                                  .where((fmark) => fmark.productName
                                      .toLowerCase()
                                      .contains(_searchQuery.toLowerCase()))
                                  .toList();
                            }
                            return _createListView(context, data);
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

  ListView _createListView(BuildContext context, List<FMark> data) {
    List<FMark> fMarks = data;

    return ListView.builder(
      itemCount: fMarks.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return FMarkAlertDialog(
                    status: confirmValidity(fMarks[index].expiryDate),
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
              confirmValidity(fMarks[index].expiryDate)
                  ? Text(
                      'Valid',
                      style: TextStyle(color: AppColors.validGreenColor),
                    )
                  : Text(
                      'Expired',
                      style: TextStyle(color: AppColors.expiredRedColor),
                    )
            ],
          ),
        );
      },
    );
  }
}
