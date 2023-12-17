import 'package:flutter/material.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 120,
            image: AssetImage(dark
                ? YoAppImages.yolightAppLogo
                : YoAppImages.yodarkAppLogo)),
        Text(YoTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(
          height: YoAppSize.sm,
        ),
        Text(YoTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
