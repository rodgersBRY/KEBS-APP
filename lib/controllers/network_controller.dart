import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkService extends GetxController {
  final RxBool _connected = false.obs;

  bool get connected => _connected.value;

  @override
  void onInit() {
    checkNetwork();
    super.onInit();
  }

  Future<void> checkNetwork() async {
    var result = await (Connectivity().checkConnectivity());
    if (result == ConnectivityResult.none) {
      _connected.value = false;
    } else {
      _connected.value = true;
    }
  }
}
