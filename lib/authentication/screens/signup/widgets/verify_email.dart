import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/screens/login/login.dart';
import 'package:yo_chat/common/widgets/success_screen/success_screen.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {

  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: ()=> Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YoAppSize.defaultSpace),
          child: Column(
            children: [
              Image(image: const AssetImage(YoAppImages.deliveredEmailIllustration),
              width:YoHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: YoAppSize.spaceBtwSections),

              Text(YoTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),

               const SizedBox(height: YoAppSize.spaceBtwItems),

               Text("support@yochat.com", style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              
              const SizedBox(height: YoAppSize.spaceBtwItems),

               Text(YoTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),

              const SizedBox(height: YoAppSize.spaceBtwSections),

              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const SuccessScreen()), child: const Text(YoTexts.tContinue)),),

              const SizedBox(height: YoAppSize.spaceBtwItems),

               SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(YoTexts.resendEmail)),),


            ],
          ),
        ),
      ),
    );
  }
}