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
            'https://kims.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAwardedDmarkPermits'),
      );

      List jsonData = jsonDecode(resp.body);

      for (var mark in jsonData) {
        _dMarks.add(MarkModel.fromJson(mark));
      }

      return _dMarks;
    } catch (err) {
      throw Exception(err);
    }
  }
}
