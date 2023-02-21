import "dart:convert";

import "package:get/get.dart";
import 'package:http/http.dart' as http;

import "../models/fortification_mark_model.dart";

class FMarkController extends GetxController {
  RxList<FMark> _fMarks = <FMark>[].obs;

  List<FMark> get fMarks => _fMarks;

  @override
  void onInit() {
    super.onInit();
    fetchFMarks();
  }

  Future<List<FMark>> fetchFMarks() async {
    var resp = await http.get(Uri.parse(
        'https://kimsint.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAwardedFmarkPermits'));

    List jsonData = jsonDecode(resp.body);

    _fMarks.assignAll(jsonData.map((fMark) => FMark.fromJson(fMark)).toList());

    return _fMarks;
  }
}

// FMark(
//   companyName: 'NICEY-NICEY MAIZE MILLERS LTD',
//   physicalAddress:
//       "PLOT NO. LOC 2, KANGARI ROAD, PLOT NO. LOC 2/KANGARI ROAD",
//   productName: "SIFTED MAIZE MEAL",
//   productBrand: "NICEY NICEY",
//   issueDate: "2024-04-14",
//   productId: "FM#AF63B6",
//   expiryDate: "2024-04-14",
// ),
// FMark(
//   companyName: 'NICEY-NICEY MAIZE MILLERS LTD',
//   physicalAddress:
//       "PLOT NO. LOC 2, KANGARI ROAD, PLOT NO. LOC 2/KANGARI ROAD",
//   productName: "SIFTED MAIZE MEAL",
//   productBrand: "NICEY NICEY",
//   productId: "FM#E42D3D",
//   issueDate: "2024-04-14",
//   expiryDate: "2024-04-14",
// )
