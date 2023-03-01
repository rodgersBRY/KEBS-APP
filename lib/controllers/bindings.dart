import 'package:get/get.dart';
import './f_mark_controller.dart';
import './diamond_controller.dart';
import './s_mark_controller.dart';
import './staff_verify_controller.dart';
import './companies_controller.dart';
import './company_details_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SMarkController>(() => SMarkController());
    Get.lazyPut<FMarkController>(() => FMarkController());
    Get.lazyPut<DMarkController>(() => DMarkController());
    Get.lazyPut<VerifyStaffController>(() => VerifyStaffController());
    Get.lazyPut<CompaniesController>(() => CompaniesController());
    Get.lazyPut<CompanyDetailsController>(() => CompanyDetailsController());
  }
}
