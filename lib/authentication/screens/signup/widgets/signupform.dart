import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/controllers/signup/signup_controller.dart';
import 'package:yo_chat/authentication/screens/signup/widgets/termsandcondition.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';
import 'package:yo_chat/utils/validators/validation.dart';

class SingupForm extends StatelessWidget {
  const SingupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
      children: [
        TextFormField(
          controller: controller.fullname,
          validator: (value) => ValidationHelper.validateEmptyText('FullName', value),
          expands: false,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              labelText: YoTexts.fullName,
              prefixIcon: Icon(Iconsax.user)),
        ),
        const SizedBox(height: YoAppSize.spaceBtwInputFields),
        TextFormField(
           controller: controller.username,
           validator: (value) => ValidationHelper.validateEmptyText('Username', value),
          expands: false,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              labelText: YoTexts.username,
              prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: YoAppSize.spaceBtwInputFields),
        TextFormField(
           controller: controller.email,
           validator: (value) => ValidationHelper.validateEmail(value),
          expands: false,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              labelText: YoTexts.email,
              prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(height: YoAppSize.spaceBtwInputFields),
        TextFormField(
           controller: controller.phoneNumber,
           validator: (value) => ValidationHelper.validatePhoneNumber(value),
          expands: false,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              labelText: YoTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(height: YoAppSize.spaceBtwInputFields),
        Obx(
          () => TextFormField(
             controller: controller.password,
             validator: (value) => ValidationHelper.validatePassword(value),
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
        const SizedBox(height: YoAppSize.spaceBtwInputFields),
        const TermsAndConditionCheckBox(),
        const SizedBox(height: YoAppSize.spaceBtwSections),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => controller.signup(),
            child: const Text(YoTexts.createAccount),
          ),
        )
      ],
    ));
  }
}
