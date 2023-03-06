import "dart:convert";

import "package:get/get.dart";
import 'package:http/http.dart' as http;

import '../models/marks_model.dart';

class FMarkController extends GetxController {
  final List<MarkModel> _fMarks = [];

  Future<List<MarkModel>> fetchFMarks() async {
    try {
      http.Response resp = await http.get(Uri.parse(
          'https://kims.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAwardedFmarkPermits'));

      List jsonData = jsonDecode(resp.body);

      _fMarks.assignAll(
          jsonData.map((fMark) => MarkModel.fromJson(fMark)).toList());

      return _fMarks;
    } catch (err) {
      throw Exception(err);
    }
  }
}
