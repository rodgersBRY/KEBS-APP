import 'package:get/get.dart';
import 'package:kebs_app/controllers/f_mark_controller.dart';
import './std_mark_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StdMarkController>(() => StdMarkController());
    Get.lazyPut<FMarkController>(() => FMarkController());
  }
}
