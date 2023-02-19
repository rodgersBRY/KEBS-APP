import 'package:get/get.dart';

import '../models/std_mark_model.dart';

class StdMarkController extends GetxController {
  RxList<StdMark> _stdMarks = [
    StdMark(
      title: "CARDAMON",
      companyName: 'CANDID NATURALS LTD',
      prodBrand: 'CANDID NATURALS',
      address: 'Pangani China House n, Chai Road',
      issueDate: "2022-08-23",
      expiryDate: '2024-08-23',
      status: "valid",
      permitNo: "SM#60035",
    ),
    StdMark(
      title: "CHICKEN MASALA",
      companyName: 'CANDID NATURALS LTD',
      prodBrand: 'CANDID NATURALS',
      address: 'Pangani China House n, Chai Road',
      issueDate: "2022-08-23",
      expiryDate: '2024-08-23',
      status: "valid",
      permitNo: "SM#60034",
    ),
    StdMark(
      title: "BREAD IMPROVERS",
      companyName: 'LESAFFRE KENYA LTD',
      ksNo: 0,
      prodBrand: 'MAGIMIX',
      address: 'DELTA OFFICE SUITES, Off Waiyaki way, 1st Flr',
      issueDate: "2022-07-20",
      expiryDate: '2024-07-20',
      status: "invalid",
      permitNo: "SM#60003",
    )
  ].obs;

  List<StdMark> get stdMarkList => _stdMarks;
}
