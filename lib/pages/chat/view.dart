import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:yo_chat/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:yo_chat/common/widgets/list_tile/chatheader.dart';
import 'package:yo_chat/pages/chat/controller.dart';
import 'package:yo_chat/pages/chat/widget/chat_list.dart';

import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/sizes.dart';

class ChatPage extends StatelessWidget {
  const ChatPage(
      {super.key,
      required this.fullname,
      required this.email,
      required this.photoUrl,
      required this.doc_id});

  final String fullname;
  final String email;
  final String photoUrl;
  final String doc_id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());
    controller.doc_id = doc_id;
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Column(
        children: [
          PrimaryHeaderContainer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: YoAppSize.lg),
                  child: ChatHeaderTiles(
                      fullname: fullname,
                      email: email,
                      photoUrl: photoUrl,
                      doc_id: doc_id,
                      onPressed: () => Navigator.pop(context)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Stack(
                children: [
                  const ChatList(),
                  Positioned(
                    bottom: 0,
                    // ignore: sized_box_for_whitespace
                    child: Container(
                        color: YoColors.softGrey,
                        width: 360,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Handle button tap here
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(
                                      5), // Adjust padding as needed
                                  child: Icon(
                                    Iconsax.camera5,
                                    size: 24,
                                    color: YoColors.primary,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  autofocus: false,
                                  maxLines: 5,
                                  minLines: 1,
                                  controller: controller.textController,
                                  focusNode: controller.contentNode,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    fillColor: YoColors.white,
                                    contentPadding: const EdgeInsets.all(10),
                                    hintText: "Send message...",
                                    hintStyle: const TextStyle(
                                        color: YoColors.darkGrey),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Handle button tap here
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(
                                      5), // Adjust padding as needed
                                  child: Icon(
                                    Iconsax.voice_cricle,
                                    size: 24,
                                    color: YoColors.primary,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Handle button tap here
                                  controller.sendMessage();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(
                                      5), // Adjust padding as needed
                                  child: Icon(
                                    Iconsax.direct_right5,
                                    size: 24,
                                    color: YoColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
