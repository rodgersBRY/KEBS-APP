// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/marks_model.dart';

class SMarkController extends GetxController {
  final List<MarkModel> _sMarks = [];

  Future<List<MarkModel>> fetchSMarks() async {
    try {
      http.Response resp = await http.get(
        Uri.parse(
            'https://kims.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAwardedSmarkPermits'),
      );

      List jsonData = jsonDecode(resp.body);

      for (var json in jsonData) {
        if (json["companyName"] != null ||
            json["physical_address"] != null ||
            json["product_id"] != null ||
            json["product_name"] != null ||
            json["product_brand"] != null ||
            json["ks_title"] != null ||
            json["issue_date"] != null ||
            json["expiry_date"] != null ||
            json["ks_NO"] != null) {
          _sMarks.assignAll(
              jsonData.map((sMark) => MarkModel.fromJson(sMark)).toList());
        }
      }

      // _sMarks.assignAll(
      //         jsonData.map((sMark) => MarkModel.fromJson(sMark)).toList());

      return _sMarks;
    } catch (err) {
      throw Exception(err);
    }
  }
}
