import "dart:convert";

import "package:get/get.dart";
import 'package:http/http.dart' as http;

import "../models/fortification_mark_model.dart";

class FMarkController extends GetxController {
  RxList<FMark> _fMarks = <FMark>[].obs;

  Future<List<FMark>> fetchFMarks() async {
    http.Response resp = await http.get(Uri.parse(
        'https://kimsint.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAwardedFmarkPermits'));

    List jsonData = jsonDecode(resp.body);

    _fMarks.assignAll(jsonData.map((fMark) => FMark.fromJson(fMark)).toList());

    return _fMarks;
  }
}
