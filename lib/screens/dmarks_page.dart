import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/dMark_controller.dart';
import '../models/marks_model.dart';
import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class DiamondMarkPage extends StatefulWidget {
  const DiamondMarkPage({super.key});

  @override
  State<DiamondMarkPage> createState() => _DiamondMarkPageState();
}

class _DiamondMarkPageState extends State<DiamondMarkPage> {
  final DMarkController _dMarkController = Get.find();

  late Future<List<MarkModel>> dMarkBuilder;

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
            title: const Text('Diamond Marks'),
          ),
          body: Column(
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
              Expanded(
                child: FutureBuilder<List<MarkModel>>(
                    future: dMarkBuilder,
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
                                  .where((dmark) =>
                                      dmark.productId.toLowerCase().contains(
                                          _searchQuery.toLowerCase()) ||
                                      dmark.productBrand.toLowerCase().contains(
                                          _searchQuery.toLowerCase()) ||
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

  ListView _createListView(BuildContext context, List<MarkModel> data) {
    List<MarkModel> dMarks = data;

    return ListView.builder(
      itemCount: dMarks.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Get.toNamed(
              '/mark-details-page',
              arguments: {
                'mark': dMarks[index],
                'imagePath': 'assets/dmark_logo.png',
                "status": confirmValidity(dMarks[index].expiryDate.toString()),
              },
            );
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
                image: AssetImage('assets/dmark_logo.png'),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          title: Text(dMarks[index].productName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(5),
              Text(
                dMarks[index].companyName,
                style: const TextStyle(color: Colors.grey),
              ),
              const Gap(10),
              confirmValidity(dMarks[index].expiryDate.toString())
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
