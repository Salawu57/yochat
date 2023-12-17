import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/common/widgets/loader/animation_loader.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';

class FullScreenLoader {
  static void openLoadingdialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: YoHelperFunctions.isDarkMode(Get.context!)
              ? YoColors.dark
              : YoColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              AnimationLoaderWidget(
                text: text,
                animation: animation,
              )
            ],
          ),
        ),
      ),
    );
  }


  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); //close the dialog
  }
}
