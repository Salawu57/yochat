import 'package:flutter/material.dart';
import 'package:yo_chat/common/widgets/appbar/appbar.dart';
import 'package:yo_chat/common/widgets/custom_shapes/circular_image/circular_image.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: YoAppBar(showBackarrow: true, title: Text('Profile')),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(YoAppSize.defaultSpace),
          child: Column(
            children: [
              CircularImage(image: YoAppImages.user)
            ],
          ),),
      )
    );
  }
}