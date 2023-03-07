import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/marks_model.dart';

class DMarkController extends GetxController {
  final List<MarkModel> _dMarks = [];

  Future<List<MarkModel>> fetchDMarks() async {
    try {
      http.Response resp = await http.get(
        Uri.parse(
            'https://kims.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAwardedDmarkPermits'),
      );

      List jsonData = jsonDecode(resp.body);

      for (var mark in jsonData) {
        if (mark['product_id'] != null) {
          _dMarks.add(MarkModel.fromJson(mark));
        }
      }

      debugPrint(_dMarks.length.toString());
      return _dMarks;
    } catch (err) {
      throw Exception(err);
    }
  }
}
