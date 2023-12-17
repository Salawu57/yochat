import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:yo_chat/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:yo_chat/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:yo_chat/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';
import 'package:yo_chat/utils/device/device_utility.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicatior,
          children: const [
            OnBoardingPage(
              image: YoAppImages.onBoardingImage1,
              title: YoTexts.onBoardingTitle1,
              subTitle: YoTexts.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: YoAppImages.onBoardingImage2,
              title: YoTexts.onBoardingTitle2,
              subTitle: YoTexts.onBoardingSubTitle2,
            ),
            OnBoardingPage(
              image: YoAppImages.onBoardingImage3,
              title: YoTexts.onBoardingTitle3,
              subTitle: YoTexts.onBoardingSubTitle3,
            ),
          ],
        ),
        const OnBoardingSkip(),
        const OnBoardingDotNavigation(),
        const OnBoardingNextButton(),
      ],
    ));
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = YoHelperFunctions.isDarkMode(context);

    return Positioned(
        right: YoAppSize.defaultSpace,
        bottom: YoDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? YoColors.primary : Colors.black),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
} 
