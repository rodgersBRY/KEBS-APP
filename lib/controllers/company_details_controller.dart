import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CompanyDetailsController extends GetxController {
  List companyDetails = [];

  Future getCompanyDetails(String companyName) async {
    var uri = Uri.parse(
        'https://kimsint.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAllAwardedPermitsByCompanyName?companyName=$companyName');

    try {
      http.Response resp = await http.get(uri);

      var jsonData = jsonDecode(resp.body);

      print(jsonData);

      companyDetails = jsonData;

      print(companyDetails);
      return companyDetails;
    } catch (err) {
      throw Exception('$err');
    }
  }
}
