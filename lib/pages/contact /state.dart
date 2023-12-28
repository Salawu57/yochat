import 'package:get/get.dart';
import 'package:yo_chat/authentication/models/user_model.dart';

class ContactState {
  
  var count = 0.obs ;

  RxList<UserModel> contactList = <UserModel>[].obs;

}
