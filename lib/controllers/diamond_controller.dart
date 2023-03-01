import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import '../models/d_mark_model.dart';
import 'package:http/http.dart' as http;

class DMarkController extends GetxController {
  List<DMark> _dMarks = [];

  Future<List<DMark>> fetchDMarks() async {
    try {
      http.Response resp = await http.get(Uri.parse(
          'https://kimsint.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAwardedDmarkPermits'));

      List jsonData = jsonDecode(resp.body);

      _dMarks
          .assignAll(jsonData.map((dMark) => DMark.fromJson(dMark)).toList());
      return _dMarks;
    } catch (err) {
      print(err);
      throw Exception('Something went wrong');
    }
  }
}
