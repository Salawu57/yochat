import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/authentication/controllers/login/login_controller.dart';
import 'package:yo_chat/authentication/screens/password_configuration/forget_password.dart';
import 'package:yo_chat/authentication/screens/signup/signup.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';
import 'package:yo_chat/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: YoAppSize.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => ValidationHelper.validateEmail(value),
              decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: YoTexts.email),
            ),
            const SizedBox(height: YoAppSize.spaceBtwInputFields),
             Obx(
                 () => TextFormField(
             controller: controller.password,
             validator: (value) => ValidationHelper.validateEmptyText('Password',value),
             obscureText: controller.hidePassword.value,
            expands: false,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                labelText: YoTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                 icon:  Icon(controller.hidePassword.value  ? Iconsax.eye_slash : Iconsax.eye ))
                ),
              ),
            ),
            const SizedBox(height: YoAppSize.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Checkbox(
                      value: controller.rememberMe.value ,
                       onChanged: (value)  => controller.rememberMe.value = !controller.rememberMe.value)),
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
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(YoTexts.signIn))),
            const SizedBox(
              height: YoAppSize.spaceBtwItems,
            ),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
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
