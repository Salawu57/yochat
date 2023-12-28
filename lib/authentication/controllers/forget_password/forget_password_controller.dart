import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/screens/password_configuration/reset_password.dart';
import 'package:yo_chat/data/repositories/authentication/authentication_repository.dart';
import 'package:yo_chat/utils/Network/network_manager.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/popups/full_screen_loader.dart';
import 'package:yo_chat/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      FullScreenLoader.openLoadingdialog(
          'Processing your request', YoAppImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      FullScreenLoader.stopLoading();

      Loaders.successSnackbar(
          title: 'Email Sent',
          message: ' Email Link Sent to Reset your password'.tr);

      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      FullScreenLoader.openLoadingdialog(
          'Processing your request', YoAppImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      FullScreenLoader.stopLoading();

      Loaders.successSnackbar(
          title: 'Email Sent',
          message: ' Email Link Sent to Reset your password'.tr);

    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
