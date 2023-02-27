import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import '../models/d_mark_model.dart';
import 'package:http/http.dart' as http;

class DMarkController extends GetxController {
  RxList<DMark> _dMarks = <DMark>[].obs;

  Future<List<DMark>> fetchDMarks() async {
    http.Response resp = await http.get(Uri.parse(
        'https://kimsint.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAwardedDmarkPermits'));

    List jsonData = jsonDecode(resp.body);

    _dMarks.assignAll(jsonData.map((dMark) => DMark.fromJson(dMark)).toList());
    return _dMarks;
  }
}

// DMark(
//   productId: "DM#123434",
//   productName: "Home Baking Flour - EXE",
//   address: "UNGA LTD - NAIROBI",
//   issueDate: "2022-11-10",
//   expiryDate: "2025-11-10",
//   status: "Valid",
// ),
// DMark(
//   productId: "DM#789873",
//   productName: "Carbonated Beverage (Coca Cola)",
//   address: "EQUATOR BOTTLERS",
//   issueDate: "2021-04-09",
//   expiryDate: '2024-04-08',
//   status: "Valid",
// ),
// DMark(
//   productId: "DM#678970",
//   productName: "Cold-rolled Steel Sections",
//   address: "INSTEEL LTD",
//   issueDate: "2019-10-22",
//   expiryDate: "2022-10-21",
//   status: "Expired",
// ),
