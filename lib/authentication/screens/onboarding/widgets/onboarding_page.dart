import 'package:flutter/material.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';



class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(YoAppSize.defaultSpace),
      child: Column(
        children: [
          Image(
            width: YoHelperFunctions.screenWidth() * 0.8,
            height: YoHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: YoAppSize.spaceBtwItems,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
