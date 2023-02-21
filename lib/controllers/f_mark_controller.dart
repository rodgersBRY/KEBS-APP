import "package:get/get.dart";
import "package:kebs_app/models/fortification_mark_model.dart";

class FMarkController extends GetxController {
  RxList<FMark> _fMarks = [
    FMark(
      companyName: 'NICEY-NICEY MAIZE MILLERS LTD',
      physicalAddress:
          "PLOT NO. LOC 2, KANGARI ROAD, PLOT NO. LOC 2/KANGARI ROAD",
      productName: "SIFTED MAIZE MEAL",
      productBrand: "NICEY NICEY",
      issueDate: "2024-04-14",
      productId: "FM#AF63B6",
      expiryDate: "2024-04-14",
    ),
    FMark(
      companyName: 'NICEY-NICEY MAIZE MILLERS LTD',
      physicalAddress:
          "PLOT NO. LOC 2, KANGARI ROAD, PLOT NO. LOC 2/KANGARI ROAD",
      productName: "SIFTED MAIZE MEAL",
      productBrand: "NICEY NICEY",
      productId: "FM#E42D3D",
      issueDate: "2024-04-14",
      expiryDate: "2024-04-14",
    )
  ].obs;

  List<FMark> get fMarks => _fMarks;

  Future<void> fetchFMarks() async {}
}
