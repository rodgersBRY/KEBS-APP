import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/diamond_controller.dart';
import '../models/d_mark_model.dart';
import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class DiamondMarkPage extends StatefulWidget {
  const DiamondMarkPage({super.key});

  @override
  State<DiamondMarkPage> createState() => _DiamondMarkPageState();
}

class _DiamondMarkPageState extends State<DiamondMarkPage> {
  DMarkController _dMarkController = Get.find();

  late Future<List<DMark>> dMarkBuilder;

  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();

  @override
  void initState() {
    super.initState();

    dMarkBuilder = _dMarkController.fetchDMarks();
  }

  bool confirmValidity(String? expiryDate) {
    if (expiryDate != "null") {
      DateTime today = DateTime.now();
      DateTime date = DateTime.parse(expiryDate!);

      return date.isAfter(today);
    } else {
      return false;
    }
  }

  String _searchQuery = "";

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
            title: Text('Diamond Marks'),
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
                child: FutureBuilder<List<DMark>>(
                    future: dMarkBuilder,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return CustomErrorWidget();
                          } else {
                            List<DMark> data = snapshot.data!;

                            if (_searchQuery.isNotEmpty) {
                              data = data
                                  .where((dmark) =>
                                      // dmark.productId!.toLowerCase().contains(
                                      //     _searchQuery.toLowerCase()) ||
                                      // dmark.productBrand!
                                      //     .toLowerCase()
                                      //     .contains(
                                      //         _searchQuery.toLowerCase()) ||
                                      dmark.companyName
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

  ListView _createListView(BuildContext context, List<DMark> data) {
    List<DMark> dMarks = data;

    return ListView.builder(
      itemCount: dMarks.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return DMarkAlertDialog(
                    status: confirmValidity(dMarks[index].expiryDate),
                    productId: dMarks[index].productId?.toString() ?? '',
                    productName: dMarks[index].productName,
                    expiryDate: dMarks[index].expiryDate,
                    issueDate: dMarks[index].issueDate,
                    physicalAddress:
                        dMarks[index].physicalAddress?.toString() ?? "null",
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
                image: AssetImage('assets/diamond_logo.png'),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          title: Text(dMarks[index].productName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(5),
              Text(
                dMarks[index].physicalAddress?.toString() ?? 'null',
                style: TextStyle(color: Colors.grey),
              ),
              Gap(10),
              confirmValidity(dMarks[index].expiryDate)
                  ? Text(
                      "Valid",
                      style: TextStyle(
                        color: AppColors.validGreenColor,
                      ),
                    )
                  : Text(
                      "Expired",
                      style: TextStyle(
                        color: AppColors.expiredRedColor,
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
