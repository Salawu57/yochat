
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/authentication/screens/password_configuration/forget_password.dart';
import 'package:yo_chat/authentication/screens/signup/signup.dart';
import 'package:yo_chat/navigation_menu.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: YoAppSize.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: YoTexts.email),
            ),
            const SizedBox(height: YoAppSize.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: YoTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(height: YoAppSize.spaceBtwInputFields / 2),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width:24, height:24, child: Checkbox(value: true, onChanged: (value) {})),
                    const Text(YoTexts.rememberMe)
                  ],
                ),
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(YoTexts.forgetPassword)),
              ],
            ),
            const SizedBox(
              height: YoAppSize.spaceBtwSections,
            ),
            SizedBox(
             
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const NavigationMenu()),
                    child: const Text(YoTexts.signIn))),
            const SizedBox(
              height: YoAppSize.spaceBtwItems,
            ),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  
                    onPressed: ()=>Get.to(() => const SignupScreen()),
                    child: const Text(YoTexts.createAccount))),
            const SizedBox(
              height: YoAppSize.spaceBtwButton,
            ),
          ],
        ),
      ),
    );
  }
}

