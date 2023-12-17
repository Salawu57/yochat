import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/screens/login/login.dart';
import 'package:yo_chat/common/styles/spacing_styles.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
        padding: YoSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            Image(image: const AssetImage(YoAppImages.staticSuccessIllustration),

              width:YoHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: YoAppSize.spaceBtwSections),

              Text(YoTexts.yourAccountCreatedTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),

               const SizedBox(height: YoAppSize.spaceBtwItems),

               Text(YoTexts.yourAccountCreatedSubTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              
              const SizedBox(height: YoAppSize.spaceBtwItems),

              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const LoginScreen()), child: const Text(YoTexts.tContinue)),),

              


          ],
        ),
      ),)
    );
  }
}