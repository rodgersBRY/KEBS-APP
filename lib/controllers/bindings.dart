import 'package:get/get.dart';
import './std_mark_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StdMarkController>(() => StdMarkController());
  }
}
