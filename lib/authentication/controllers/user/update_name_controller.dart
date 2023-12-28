import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/controllers/user/user_controller.dart';
import 'package:yo_chat/authentication/screens/profile/profile.dart';
import 'package:yo_chat/data/repositories/user/user_repository.dart';
import 'package:yo_chat/utils/Network/network_manager.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/popups/full_screen_loader.dart';
import 'package:yo_chat/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final fullName = TextEditingController();

  final userController = UserController.instance;

  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  void initializeName() {
    fullName.text = userController.user.value.fullName;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingdialog(
          "We are updating your information....", YoAppImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'FullName': fullName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.fullName = fullName.text.trim();

      FullScreenLoader.stopLoading();

      Loaders.successSnackbar(
          title: 'Congratulations!', message: 'Your name has been updated');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackbar(title: 'Oh Snap', message: e.toString());
    }
  }
}
