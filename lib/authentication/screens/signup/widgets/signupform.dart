import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/screens/signup/widgets/termsandcondition.dart';
import 'package:yo_chat/authentication/screens/signup/widgets/verify_email.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';

class SingupForm extends StatelessWidget {
  const SingupForm({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {

    return Form(
        child: Column(
      children: [
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              labelText: YoTexts.firstName,
              prefixIcon: Icon(Iconsax.user)),
        ),
        const SizedBox(height: YoAppSize.spaceBtwInputFields),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              labelText: YoTexts.username,
              prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: YoAppSize.spaceBtwInputFields),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              labelText: YoTexts.email,
              prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(height: YoAppSize.spaceBtwInputFields),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              labelText: YoTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(height: YoAppSize.spaceBtwInputFields),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              labelText: YoTexts.password,
              prefixIcon: Icon(Iconsax.password_check)),
        ),
        const SizedBox(height: YoAppSize.spaceBtwInputFields),

        const TermsAndConditionCheckBox(),
    
        const SizedBox(height: YoAppSize.spaceBtwSections),
    
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const VerifyEmailScreen()),
            child: const Text(YoTexts.createAccount),
          ),
        )
      ],
    )
    );
  }
}

