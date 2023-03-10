// ignore_for_file: file_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/marks_model.dart';

class DMarkController extends GetxController {
  final List<MarkModel> _dMarks = [];

  List<MarkModel> get dMarks => _dMarks;

  Future<List<MarkModel>> fetchDMarks() async {
    try {
      http.Response resp = await http.get(
        Uri.parse(
            'https://kims.kebs.org:8006/api/v1/migration/anonymous/mobile/Dmarks'),
      );

      List jsonData = jsonDecode(resp.body);

      _dMarks.assignAll(
          jsonData.map((dMark) => MarkModel.fromJson(dMark)).toList());

      return _dMarks;
    } catch (err) {
      throw Exception(err);
    }
  }
}
