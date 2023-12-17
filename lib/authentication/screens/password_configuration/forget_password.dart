import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:yo_chat/authentication/screens/password_configuration/reset_password.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(YoAppSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(YoTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: YoAppSize.spaceBtwItems,),
            Text(YoTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: YoAppSize.spaceBtwSections * 2),
            
            TextFormField(
              decoration: const InputDecoration(
                   isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
               labelText: YoTexts.email, prefixIcon: Icon(Iconsax.direct_right)
              ),
            ),

            const SizedBox(height: YoAppSize.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()),
              child: const Text(YoTexts.submit)))
          ],
        ),
        
        ),

    );
  }
}