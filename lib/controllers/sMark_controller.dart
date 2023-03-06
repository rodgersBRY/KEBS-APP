// ignore: file_names
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

      _sMarks.assignAll(
          jsonData.map((sMark) => MarkModel.fromJson(sMark)).toList());

      return _sMarks;
    } catch (err) {
      throw Exception(err);
    }
  }
}
