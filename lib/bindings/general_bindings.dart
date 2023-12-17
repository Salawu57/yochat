import 'package:get/get.dart';
import '../utils/Network/network_manager.dart';


class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
