import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/popups/full_screen_loader.dart';
import 'package:yo_chat/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final fullname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      //start loading
      FullScreenLoader.openLoadingdialog(
          'We are processing your information...', YoAppImages.acerlogo);

      //check internet connection
      //final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   Loaders.warningSnackbar(
      //       title: "No internet connection",
      //       message: 'Please connect to the Internet');
      //   return;
      // }
      //form validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      //privacy policy
      if (!privacyPolicy.value) {
        Loaders.warningSnackbar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create an account, you must read and accept the privacy policy and term of use.');
      }

      //register user
      //save authentication
      //show sucess
      //move to very email
    } catch (e) {
      // show some generic error message
      Loaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //remove loader
      FullScreenLoader.stopLoading();
    }
  }
}
