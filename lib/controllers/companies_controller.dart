import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CompaniesController extends GetxController {
  RxList _companies = [].obs;

  Future<List> fetchCompanies() async {
    try {
      http.Response resp = await http.get(Uri.parse(
          'https://kimsint.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAllCompanies'));

      var jsonData = jsonDecode(resp.body);

      _companies.assignAll(jsonData
          .map((company) => {"companyName": company['companyName']})
          .toList());

      return _companies;
    } catch (err) {
      throw Exception('Something went wrong');
    }
  }
}
