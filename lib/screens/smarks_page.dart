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

    sMarkFuture = sMarkController.fetchSMarks();
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
                Expanded(
                  child: FutureBuilder<List<MarkModel>>(
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
                              return CustomListView(marks: data);
                            }
                        }
                      }),
                )
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
}
