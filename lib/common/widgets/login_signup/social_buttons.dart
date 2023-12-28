import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/controllers/login/login_controller.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/constants/sizes.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: YoColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: YoAppSize.iconMd,
              height: YoAppSize.iconMd,
              image: AssetImage(YoAppImages.google),
            ),
          ),
        ),
        const SizedBox(
          width: YoAppSize.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: YoColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: YoAppSize.iconMd,
              height: YoAppSize.iconMd,
              image: AssetImage(YoAppImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
