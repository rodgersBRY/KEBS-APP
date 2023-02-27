import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VerifyStaffController extends GetxController {
  RxBool _loading = false.obs;

  bool get loading => _loading.value;

  Future<void> verifyStaff() async {
    // Map<String, dynamic> _requestBody = {
    //   "header": {
    //     "serviceName": "BSKApp",
    //     "messageID": "BSK",
    //     "connectionID": "BskAccount",
    //     "connectionPassword": "P@\$\$w0rd@kebs"
    //   },
    //   "request": {"staffID": "1334"}
    // };

    final uri = Uri.https(
      'connect.kebs.org',
      '/hr/urls/kebs_staff.php',
    );

    final resp = await http.post(uri, body: {
      "request": {"staffID": "1334"},
      "header": {
        "serviceName": "BSKApp",
        "messageID": "BSK",
        "connectionID": "BskAccount",
        "connectionPassword": "P@w0rd@kebs"
      },
    });

    final respBody = jsonDecode(resp.body);

    print(respBody);

    _loading.value = false;
  }
}
