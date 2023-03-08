import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebs_app/controllers/dMark_controller.dart';

import '../models/marks_model.dart';

class GlobalFunctions {
  static TextEditingController permitNoController = TextEditingController();
  final DMarkController dMarkController = Get.find();

  searchByPermitNumber() {
    List<MarkModel> dmarks = dMarkController.dMarks;

    List<MarkModel> result = dmarks
        .where(
          (mark) =>
              mark.productId.toLowerCase() ==
              permitNoController.text.trim().toLowerCase(),
        )
        .toList();

    return result;
  }
}
