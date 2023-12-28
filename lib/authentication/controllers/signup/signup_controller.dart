import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/models/user_model.dart';
import 'package:yo_chat/authentication/screens/signup/widgets/verify_email.dart';
import 'package:yo_chat/data/repositories/authentication/authentication_repository.dart';
import 'package:yo_chat/data/repositories/user/user_repository.dart';
import 'package:yo_chat/utils/Network/network_manager.dart';
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

  void signup() async {
    try {
      //start loading
      FullScreenLoader.openLoadingdialog(
          'We are processing your information...', YoAppImages.docerAnimation);

      //check internet connection
      
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
         FullScreenLoader.stopLoading();
        Loaders.warningSnackbar(
            title: "No internet connection",
            message: 'Please connect to the Internet');
      
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //privacy policy
      if (!privacyPolicy.value) {
        FullScreenLoader.stopLoading();
        Loaders.warningSnackbar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create an account, you must read and accept the privacy policy and term of use.');

        return;
      }

      //register user
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authentication

      final newUser = UserModel(
        id: userCredential.user!.uid,
        fullName: fullname.text.trim(),
        email: email.text.trim(),
        username: username.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());

      userRepository.saveUserRecord(newUser);


       FullScreenLoader.stopLoading();

      //show sucess
      Loaders.successSnackbar(
          title: 'Congratulations',
          message:
              'Your account has been successfully created! Please verify from your email account');
      //move to very email
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
       FullScreenLoader.stopLoading();
      // show some generic error message
      Loaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    } 
  }
}
