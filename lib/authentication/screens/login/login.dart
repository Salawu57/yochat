import 'package:flutter/material.dart';
import 'package:yo_chat/authentication/screens/login/widgets/loginforrm.dart';
import 'package:yo_chat/authentication/screens/login/widgets/loginheader.dart';
import 'package:yo_chat/common/styles/spacing_styles.dart';
import 'package:yo_chat/common/widgets/login_signup/form_divider.dart';
import 'package:yo_chat/common/widgets/login_signup/social_buttons.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YoHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: YoSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [

              LoginHeader(dark: dark),

              const LoginForm(),

              FormDivider(dark: dark),
              
               const SizedBox(
                        height: YoAppSize.spaceBtwSections,
                 ),

              const SocialButton()
            ],
          ),
        ),
      ),
    );
  }
}


