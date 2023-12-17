import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yo_chat/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/device/device_utility.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = OnBoardingController.instance;

    final dark = YoHelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: YoDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: YoAppSize.defaultSpace,
        child: SmoothPageIndicator(
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            count: 3,
            effect: ExpandingDotsEffect(
                activeDotColor: dark ? YoColors.light : YoColors.dark,
                dotHeight: 6)));
  }
}
