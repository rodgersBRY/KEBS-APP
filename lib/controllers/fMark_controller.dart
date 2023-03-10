// ignore_for_file: file_names

import "dart:convert";

import "package:get/get.dart";
import 'package:http/http.dart' as http;

import '../models/marks_model.dart';

class FMarkController extends GetxController {
  final List<MarkModel> _fMarks = [];

  List<MarkModel> get fMarks => _fMarks;

  Future<List<MarkModel>> fetchFMarks() async {
    try {
      http.Response resp = await http.get(
        Uri.parse(
            'https://kims.kebs.org:8006/api/v1/migration/anonymous/mobile/Fmarks'),
      );

      List jsonData = jsonDecode(resp.body);

      _fMarks.assignAll(
          jsonData.map((fMark) => MarkModel.fromJson(fMark)).toList());

      return _fMarks;
    } catch (err) {
      throw Exception(err);
    }
  }
}
