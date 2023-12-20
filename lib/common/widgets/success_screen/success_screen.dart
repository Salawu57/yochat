import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yo_chat/common/styles/spacing_styles.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: YoSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),
            const SizedBox(height: YoAppSize.spaceBtwSections),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: YoAppSize.spaceBtwItems),
            Text(
             subtitle,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: YoAppSize.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed:onPressed,
                  child: const Text(YoTexts.tContinue)),
            ),
          ],
        ),
      ),
    ));
  }
}
