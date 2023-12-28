import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:yo_chat/authentication/screens/login/login.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(YoAppSize.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(YoAppImages.deliveredEmailIllustration),
                width: YoHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: YoAppSize.spaceBtwSections),
              Text(
                YoTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: YoAppSize.spaceBtwItems),
              Text(
                YoTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: YoAppSize.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text(YoTexts.done)),
              ),
              const SizedBox(height: YoAppSize.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(YoTexts.resendEmail)),
              ),
            ],
          ),
        )));
  }
}
