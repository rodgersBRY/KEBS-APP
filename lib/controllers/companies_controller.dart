import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/companies_model.dart';

class CompaniesController extends GetxController {
  final List<Company> _companies = [];

  Future<List<Company>> fetchCompanies() async {
    try {
      http.Response resp = await http.get(Uri.parse(
          'https://kimsint.kebs.org:8006/api/v1/migration/anonymous/mobile/companies'));

      List jsonData = jsonDecode(resp.body);

      _companies.assignAll(
              jsonData.map((company) => Company.fromJson(company)).toList());

      return _companies;
    } catch (err) {
      throw Exception(err);
    }
  }
}
