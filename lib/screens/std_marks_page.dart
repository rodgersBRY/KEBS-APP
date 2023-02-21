// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/std_mark_controller.dart';
import '../models/std_mark_model.dart';
import '../utils/app_colors.dart';
import '../widgets/widgets.dart';

class StdMarksPage extends StatefulWidget {
  StdMarksPage({super.key});

  @override
  State<StdMarksPage> createState() => _StdMarksPageState();
}

class _StdMarksPageState extends State<StdMarksPage> {
  // dependency injection
  StdMarkController stdMarksController = Get.find();

  // to be assigned upon page load
  late Future<List<StdMark>> stdMrkBuilder;

  // controller and focus node for the textfield widget
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    stdMrkBuilder = stdMarksController.fetchStdMarks();
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
            title: Text('Standardization Marks'),
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
                  ),
                  ),
              Gap(20),
              Expanded(
                child: FutureBuilder<List<StdMark>>(
                    future: Future.delayed(
                      Duration(seconds: 3),
                      () => stdMrkBuilder,
                    ),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return new Text('Error: ${snapshot.error}');
                          } else {
                            List<StdMark> data = snapshot.data!;
                            
                            if (_searchQuery.isNotEmpty) {
                              data = data
                                  .where((std) => std.title
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

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}

ListView _createListView(BuildContext context, List<StdMark> data) {
  List<StdMark> stdMarks = data;

  return ListView.builder(
    itemCount: stdMarks.length,
    itemBuilder: (context, index) {
      return ListTile(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return StdAlertDialog(
                  permitNo: stdMarks[index].permitNo,
                  title: stdMarks[index].title,
                  expiryDate: stdMarks[index].expiryDate,
                  status: stdMarks[index].status,
                  issueDate: stdMarks[index].issueDate,
                  address: stdMarks[index].address,
                  prodBrand: stdMarks[index].prodBrand,
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
              image: AssetImage('assets/std_logo.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        title: Text(stdMarks[index].title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(5),
            Text(
              stdMarks[index].companyName,
              style: TextStyle(color: Colors.grey),
            ),
            Gap(10),
            stdMarks[index].status == 'valid'
                ? Text(
                    'Valid',
                    style: TextStyle(color: Color.fromARGB(255, 73, 230, 79)),
                  )
                : Text(
                    'Invalid',
                    style: TextStyle(color: Colors.red),
                  ),
          ],
        ),
      );
    },
  );
}
