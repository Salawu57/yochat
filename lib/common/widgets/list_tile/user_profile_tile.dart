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

    return Obx(() {
      if (controller.profileLoading.value) {
        return const ShimmerEffect(width: 80, height: 15);
      } else {
        return ListTile(
        leading: const CircularImage(
            image: YoAppImages.user, width: 50, height: 50, padding: 0),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: YoColors.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: YoColors.white),
        ),
        trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Iconsax.edit,
              color: YoColors.white,
            )),
      );

      }
      
    });
  }
}
