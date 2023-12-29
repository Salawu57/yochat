import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/data/repositories/authentication/authentication_repository.dart';
import 'package:yo_chat/pages/chat/state.dart';
import 'package:yo_chat/utils/msgContent/msgcontent.dart';

class ChatController extends GetxController {
  var doc_id = null;

  static ChatController get instance => Get.find();

  final ChatState state = ChatState();

  final textController = TextEditingController();

  ScrollController msgScrolling = ScrollController();

  FocusNode contentNode = FocusNode();

  final user_id = AuthenticationRepository.instance.authUser!.uid;

  final _db = FirebaseFirestore.instance;

  set docId(String id) {
    doc_id = id;
  }

  var listener;

  @override
  void onReady() {
    super.onReady();

    print("doc_id: ============> $doc_id");
    var messages = _db
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgcontent, options) =>
                msgcontent.toFirestore())
        .orderBy("addtime", descending: true);
    state.msgcontentList.clear();
    listener = messages.snapshots().listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            if (change.doc.data() != null) {
              state.msgcontentList.insert(0, change.doc.data()!);
            }
            break;

          case DocumentChangeType.modified:
            break;

          case DocumentChangeType.removed:
            break;
        }
      }
    }, onError: (error) => print("Listen failed $error"));
  }

  @override
  void dispose() {
    msgScrolling.dispose();
    listener.cancel();
    super.dispose();
  }

  sendMessage() async {
    String sendContent = textController.text;

    final content = Msgcontent(
        uid: user_id,
        content: sendContent,
        type: "text",
        addtime: Timestamp.now());

    await _db
        .collection('message')
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgcontent, options) =>
                msgcontent.toFirestore())
        .add(content)
        .then((DocumentReference doc) {
      print("Document snapshot added with id ${doc.id}");
      textController.clear();
      Get.focusScope?.unfocus();
    });
    await _db
        .collection("message")
        .doc(doc_id)
        .update({"last_msg": sendContent, "last_time": Timestamp.now()});
  }
}
