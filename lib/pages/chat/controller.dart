import 'package:get/get.dart';
import 'package:yo_chat/data/repositories/authentication/authentication_repository.dart';
import 'package:yo_chat/pages/chat/state.dart';

class ChatController extends GetxController {

  static ChatController get instance => Get.find();

  final token = AuthenticationRepository.instance.authUser!.uid;

  final ChatState state = ChatState();
}
