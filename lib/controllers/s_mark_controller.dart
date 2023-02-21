import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/s_mark_model.dart';

class SMarkController extends GetxController {
  RxList<SMark> _sMarks = <SMark>[].obs;

  Future<List<SMark>> fetchSMarks() async {
    http.Response resp = await http.get(Uri.parse(
        'https://kims.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAwardedSmarkPermits'));

    List jsonData = jsonDecode(resp.body);

    _sMarks.assignAll(jsonData.map((sMark) => SMark.fromJson(sMark)).toList());

    return _sMarks;
  }
}
