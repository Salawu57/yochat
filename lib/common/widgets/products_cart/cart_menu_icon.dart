import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/utils/constants/colors.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
   required this.iconColor, 
   required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.shopping_bag,
            color: YoColors.white,
          )),
      Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: YoColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
                child: Text('2',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: YoColors.white, fontSizeFactor: 0.8))),
          ))
    ]);
  }
}
