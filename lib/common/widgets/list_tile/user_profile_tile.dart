import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/authentication/controllers/user/user_controller.dart';
import 'package:yo_chat/common/widgets/custom_shapes/circular_image/circular_image.dart';
import 'package:yo_chat/common/widgets/loader/shimmer.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';

class UserProfileTiles extends StatelessWidget {
  const UserProfileTiles({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
// Obx(() {
//       if (controller.profileLoading.value) {
//         return const ShimmerEffect(width: 80, height: 15);
//       } else {
//         return
    return ListTile(
      leading: Obx(() {
        return CachedNetworkImage(
          imageUrl: controller.user.value.profilePicture,
          imageBuilder: (context, ImageProvider) => Container(
            height: 50,
            width: 50,
            margin: null,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(44)),
                image:
                    DecorationImage(image: ImageProvider, fit: BoxFit.cover)),
          ),
          errorWidget: (context, url, error) =>
              const Image(image: AssetImage(YoAppImages.user)),
        );
      }),
      title: Obx(() {
        if (controller.profileLoading.value) {
          return const ShimmerEffect(width: 80, height: 15);
        } else {
          return Text(
            controller.user.value.fullName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: YoColors.white),
          );
        }
      }),
      subtitle: Obx(() {
        if (controller.profileLoading.value) {
          return const ShimmerEffect(width: 80, height: 15);
        } else {
          return Text(
            controller.user.value.email,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: YoColors.white),
          );
        }
      }),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: YoColors.white,
          )),
    );
  }
}
