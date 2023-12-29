import 'package:get/get.dart';
import 'package:yo_chat/utils/msgContent/msgcontent.dart';

class ChatState {
  RxList<Msgcontent> msgcontentList = <Msgcontent>[].obs;

  var to_uid = "".obs;
  var to_name = "".obs;
  var to_avatar = "".obs;
  
}
