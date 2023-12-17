import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/common/widgets/custom_shapes/circular_image/circular_image.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';

class UserProfileTiles extends StatelessWidget {
  const UserProfileTiles({
    super.key, this.onPressed,
  });

final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
     leading:const CircularImage(image: YoAppImages.user, width: 50, height: 50, padding: 0),
     title: Text('Babatunde', style: Theme.of(context).textTheme.headlineSmall!.apply(color: YoColors.white),),
     subtitle: Text('babatunde@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: YoColors.white),),
     trailing: IconButton(onPressed:onPressed, icon: const Icon(Iconsax.edit, color: YoColors.white,)),
                  );
  }
}