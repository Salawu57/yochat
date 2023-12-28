import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:yo_chat/authentication/models/user_model.dart';
import 'package:yo_chat/pages/contact%20/controller.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  Widget _buildListItem(UserModel item, BuildContext context) {
    final controller = Get.put(ContactController());
    return Container(
      padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child: InkWell(
        onTap: () {
         
          // ignore: unnecessary_null_comparison
          if (item.id != null) {
            
            controller.goChat(item);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 15.0),
              child: SizedBox(
                width: 54.0,
                height: 54.0,
                child: CachedNetworkImage(
                  imageUrl: item.profilePicture,
                  imageBuilder: (context, ImageProvider) => Container(
                    height: 30,
                    width: 30,
                    margin: null,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(44)),
                        image: DecorationImage(
                            image: ImageProvider, fit: BoxFit.cover)),
                  ),
                  errorWidget: (context, url, error) =>
                      const Image(image: AssetImage(YoAppImages.user)),
                ),
              ),
            ),
            Container(
              width: 250.0,
              padding: const EdgeInsets.only(
                top: 15,
                left: 0,
                right: 0,
                bottom: 0,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFE5E5E5)),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 200.0,
                    height: 42.0,
                    child: Text(
                      item.fullName ?? '',
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactController());

    return Obx(
      () => CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var item = controller.state.contactList[index];
                  return _buildListItem(item, context);
                },
                childCount: controller.state.contactList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
