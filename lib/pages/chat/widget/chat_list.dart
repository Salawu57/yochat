import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/pages/chat/controller.dart';
import 'package:yo_chat/pages/chat/widget/chat_left_item.dart';
import 'package:yo_chat/pages/chat/widget/chat_right_item.dart';
import 'package:yo_chat/utils/constants/colors.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());
    return Obx(
      () => Container(
        padding: const EdgeInsets.only(bottom: 50),
        child: CustomScrollView(
          reverse: true,
          controller: controller.msgScrolling,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                var item = controller.state.msgcontentList[index];
                if (controller.user_id == item.uid) {
                  return ChatRightItem(item);
                }
                return ChatLeftItem(item);
                
              }, childCount: controller.state.msgcontentList.length)),
            )
          ],
        ),
      ),
    );
  }
}
