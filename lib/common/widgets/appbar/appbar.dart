import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/device/device_utility.dart';

class YoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const YoAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackarrow = false,
    
    });

  final Widget? title;
  final bool showBackarrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: YoAppSize.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading:  showBackarrow ? IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)) 
                                : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,

         title: title,
         actions: actions,
      ),
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(YoDeviceUtils.getAppBarHeight());
}