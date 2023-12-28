import 'package:get/get.dart';
import 'package:yo_chat/pages/contact%20/controller.dart';

class ContactBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() => ContactController());
  }
}
