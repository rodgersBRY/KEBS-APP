import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CompanyDetailsController extends GetxController {
  List companyDetails = [];

  Future getCompanyDetails(String companyName) async {
    try {
      http.Response resp = await http.get(
        Uri.parse(
            'https://kimsint.kebs.org:8006/api/v1/migration/anonymous/mobile/company?companyName=$companyName'),
      );

      var jsonData = jsonDecode(resp.body);

      companyDetails = jsonData;

      return companyDetails;
    } catch (err) {
      throw Exception(err);
    }
  }
}
