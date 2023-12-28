import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/authentication/controllers/user/user_controller.dart';
import 'package:yo_chat/common/widgets/custom_shapes/circular_image/circular_image.dart';
import 'package:yo_chat/common/widgets/loader/shimmer.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';

class ChatHeaderTiles extends StatelessWidget {
  const ChatHeaderTiles({
    super.key,
    this.onPressed, required this.fullname, required this.email, required this.photoUrl,
  });
  
  final String fullname;
  final String email;
  final String photoUrl;


  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: SizedBox(
        width: 40,
        height: 40,
        child: CachedNetworkImage(
          imageUrl: photoUrl,
          imageBuilder: (context, ImageProvider) => Container(
            height: 30,
            width: 30,
            margin: null,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(44)),
              image: DecorationImage(
                image: ImageProvider,
                fit: BoxFit.cover
              )
            ),
          ),
          errorWidget: (context, url, error) => const Image(
            image: AssetImage(YoAppImages.user)),
        ),
      ),
      title: Text(
          fullname,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: YoColors.white),
        ),
      
      subtitle:  Text(
          email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: YoColors.white),
        ),

      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.arrow_right_3,
            color: YoColors.white,
          )),
    );
  }
}
