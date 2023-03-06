// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/sMark_controller.dart';
import '../models/marks_model.dart';
import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class SMarksPage extends StatefulWidget {
  const SMarksPage({super.key});

  @override
  State<SMarksPage> createState() => _SMarksPageState();
}

class _SMarksPageState extends State<SMarksPage> {
  final SMarkController sMarkController = Get.find();

  // ignore: null_argument_to_non_null_type
  late Future<List<MarkModel>> sMarkFuture;

  // controller and focus node for the textfield widget
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchNode = FocusNode();

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    // if (!_networkService.connected) {
    //   Get.snackbar("Network Error", "Check your Internet Connection");
    // }
    sMarkFuture = sMarkController.fetchSMarks();
  }

  bool confirmValidity(String expiryDate) {
    DateTime today = DateTime.now();
    DateTime date = DateTime.parse(expiryDate);

    return date.isAfter(today);
  }

  // refresh data upon dragging down
  Future<void> _refreshData() {
    sMarkFuture = sMarkController.fetchSMarks();
    return sMarkFuture;
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
            title: const Text('Standardization Marks'),
          ),
          body: RefreshIndicator(
            onRefresh: _refreshData,
            child: Column(
              children: [
                const Gap(20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Company Name, Permit No or Product Brand...',
                        hintStyle: TextStyle(fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                FutureBuilder<List<MarkModel>>(
                    future: sMarkFuture,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return const Center(
                              child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return const CustomErrorWidget();
                          } else {
                            List<MarkModel> data = snapshot.data!;

                            if (_searchQuery.isNotEmpty) {
                              data = data
                                  .where((std) =>
                                      std.productId.toLowerCase().contains(
                                          _searchQuery.toLowerCase()) ||
                                      std.companyName.toLowerCase().contains(
                                          _searchQuery.toLowerCase()) ||
                                      std.productBrand
                                          .toLowerCase()
                                          .contains(_searchQuery.toLowerCase()))
                                  .toList();
                            }
                            return Expanded(
                                child: _createListView(context, data));
                          }
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  ListView _createListView(BuildContext context, List<MarkModel> data) {
    List<MarkModel> stdMarks = data;

    return ListView.builder(
      itemCount: stdMarks.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                    imagePath: 'assets/smark_logo.png',
                    status: confirmValidity(stdMarks[index].expiryDate),
                    productId: stdMarks[index].productId,
                    productName: stdMarks[index].productName,
                    expiryDate: stdMarks[index].expiryDate,
                    issueDate: stdMarks[index].issueDate,
                    physicalAddress: stdMarks[index].physicalAddress,
                    productBrand: stdMarks[index].productBrand,
                    ksNo: stdMarks[index].ksNo,
                    ksTitle: stdMarks[index].ksTitle,
                    companyName: stdMarks[index].companyName,
                  );
                });
          },
          splashColor: AppColors.primaryBlueColor.withOpacity(.3),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 5,
          ),
          leading: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/smark_logo.png'),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          title: Text(stdMarks[index].productName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(5),
              Text(
                stdMarks[index].companyName,
                style: const TextStyle(color: Colors.grey),
              ),
              const Gap(10),
              confirmValidity(stdMarks[index].expiryDate)
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
