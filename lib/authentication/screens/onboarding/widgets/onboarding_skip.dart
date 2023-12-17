import 'package:yo_chat/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/device/device_utility.dart';
import 'package:flutter/material.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: YoDeviceUtils.getAppBarHeight(),
        right: YoAppSize.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
