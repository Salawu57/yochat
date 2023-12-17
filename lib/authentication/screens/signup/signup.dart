import 'package:flutter/material.dart';
import 'package:yo_chat/authentication/screens/signup/widgets/signupform.dart';
import 'package:yo_chat/common/widgets/login_signup/form_divider.dart';
import 'package:yo_chat/common/widgets/login_signup/social_buttons.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YoHelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(YoAppSize.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(YoTexts.signupTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: YoAppSize.spaceBtwSections),

                const SingupForm(),

                const SizedBox(height: YoAppSize.spaceBtwSections),

                 FormDivider(dark: dark),

                 const SizedBox(height: YoAppSize.spaceBtwSections),

                 const SocialButton(),

              ],
            ),
          ),
        ));
  }
}

