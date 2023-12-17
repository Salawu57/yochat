import 'package:flutter/material.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';

class TermsAndConditionCheckBox extends StatelessWidget {
  const TermsAndConditionCheckBox({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = YoHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child:
                Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(height: YoAppSize.spaceBtwInputFields),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${YoTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: YoTexts.privacyPolicy,
              style:
                  Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark
                            ? YoColors.white
                            : YoColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? YoColors.white
                            : YoColors.primary,
                      )),
          TextSpan(
              text: '${YoTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: YoTexts.termsOfUse,
              style:
                  Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark
                            ? YoColors.white
                            : YoColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? YoColors.white
                            : YoColors.primary,
                      )),
        ]))
      ],
    );
  }
}
