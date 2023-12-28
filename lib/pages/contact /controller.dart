

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/models/msg.dart';
import 'package:yo_chat/authentication/models/user_model.dart';
import 'package:yo_chat/data/repositories/authentication/authentication_repository.dart';
import 'package:yo_chat/data/repositories/user/user_repository.dart';
import 'package:yo_chat/pages/chat/view.dart';
import 'package:yo_chat/pages/contact%20/state.dart';

class ContactController extends GetxController {
  static ContactController get instance => Get.find();

    final userRepository = Get.put(UserRepository());

  final ContactState state = ContactState();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final token = AuthenticationRepository.instance.authUser!.uid;

  @override
  void onReady() {
    super.onReady();
    asynLoadAllData();
  }

  goChat(UserModel to_userdata) async {
    var from_messages = await _db
        .collection('message')
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where('from_uid', isEqualTo: token)
        .where('to_uid', isEqualTo: to_userdata.id)
        .get();

    var to_messages = await _db
        .collection('message')
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where('from_uid', isEqualTo: to_userdata.id)
        .where('to_uid', isEqualTo: token)
        .get();

    if (from_messages.docs.isEmpty && to_messages.docs.isEmpty) {

      var userdata = await userRepository.fetchUserDetails();

      var msgdata = Msg(
        from_uid: userdata.id,
        to_uid: to_userdata.id,
        from_name: userdata.fullName,
        to_name: to_userdata.fullName,
        from_avatar: userdata.profilePicture,
        to_avatar: to_userdata.profilePicture,
        last_msg: '',
        last_time: Timestamp.now(),
        msg_num: 0,
      );

      
      _db
          .collection('message')
          .withConverter(
              fromFirestore: Msg.fromFirestore,
              toFirestore: (Msg msg, options) => msg.toFirestore())
          .add(msgdata)
          .then((value) {
        Get.to(() => ChatPage(fullname:to_userdata.fullName, email:to_userdata.email, photoUrl: to_userdata.profilePicture));
        // Get.toNamed('/chat', parameters: {
        //   'doc_id': value.id,
        //   'to_uid': to_userdata.id ?? '',
        //   'to_name': to_userdata.fullName ?? '',
        //   'to_avatar': to_userdata.profilePicture ?? '',
        // });
      });
    } else {
      if (from_messages.docs.isNotEmpty) {
        Get.to(() => ChatPage(fullname:to_userdata.fullName, email:to_userdata.email, photoUrl: to_userdata.profilePicture));
        // Get.toNamed('/chat', parameters: {
        //   'doc_id': from_messages.docs.first.id,
        //   'to_uid': to_userdata.id ?? '',
        //   'to_name': to_userdata.fullName ?? '',
        //   'to_avatar': to_userdata.profilePicture ?? '',
        // });
      }
      if (to_messages.docs.isNotEmpty) {
         Get.to(() => ChatPage(fullname:to_userdata.fullName, email:to_userdata.email, photoUrl: to_userdata.profilePicture));
        // Get.toNamed('/chat', parameters: {
        //   'doc_id': to_messages.docs.first.id,
        //   'to_uid': to_userdata.id ?? '',
        //   'to_name': to_userdata.fullName ?? '',
        //   'to_avatar': to_userdata.profilePicture ?? '',
        // });
      }
    }
  }

  asynLoadAllData() async {
    var usersbase = await _db
        .collection('users')
        .where("accessToken", isNotEqualTo: token)
        .withConverter(
            fromFirestore: UserModel.fromFirestore,
            toFirestore: (UserModel usermodel, options) =>
                usermodel.toFirestore())
        .get();

    for (var doc in usersbase.docs) {
      state.contactList.add(doc.data());
      if (kDebugMode) {
        print(doc.toString());
      }
    }
  }
}
