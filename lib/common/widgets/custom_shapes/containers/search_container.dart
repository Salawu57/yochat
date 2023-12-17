import 'package:flutter/material.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/device/device_utility.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key, required this.text, this.icon, this.showBackground = true, this.showborder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showborder;

  @override
  Widget build(BuildContext context) {
    final dark = YoHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: YoAppSize.defaultSpace),
      child: Container(
        width: YoDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(YoAppSize.sm),
        decoration: BoxDecoration(
          color: showBackground ? dark ? YoColors.dark : YoColors.light : Colors.transparent,
          borderRadius: BorderRadius.circular(YoAppSize.cardRadiusXs),
          border: showborder? Border.all(color: YoColors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: YoColors.darkerGrey),
            const SizedBox(
              width: YoAppSize.spaceBtwItems,
            ),
            Text(text, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
