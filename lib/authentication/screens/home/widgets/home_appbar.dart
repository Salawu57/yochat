import 'package:flutter/material.dart';
import 'package:yo_chat/common/widgets/appbar/appbar.dart';
import 'package:yo_chat/common/widgets/products_cart/cart_menu_icon.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return YoAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(YoTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: YoColors.grey)),
          Text(YoTexts.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: YoColors.white)),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () {},
          iconColor: YoColors.white,
        )
      ],
    );
  }
}

