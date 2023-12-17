import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: dark ? YoColors.darkGrey : YoColors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),
        Text(YoTexts.orSignInWith.capitalize!,
            style: Theme.of(context).textTheme.labelMedium),
        Flexible(
            child: Divider(
          color: dark ? YoColors.darkGrey : YoColors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        ))
      ],
    );
  }
}
