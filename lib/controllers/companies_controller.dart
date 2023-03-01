import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/companies_model.dart';

class CompaniesController extends GetxController {
  RxList<Company> _companies = <Company>[].obs;

  Future<List<Company>> fetchCompanies() async {
    print('loading...');
    
    try {
      http.Response resp = await http.get(Uri.parse(
          'https://kimsint.kebs.org:8006/api/v1/migration/anonymous/kebsWebsite/getAllCompanies'));

      var jsonData = jsonDecode(resp.body);

      print(jsonData);
      print('done loading');
      
      _companies.assignAll(
          jsonData.map((company) => Company.fromJson(company)).toList());

      print(_companies);

      return _companies;
    } catch (err) {
      throw Exception('Something went wrong');
    }
  }
}
