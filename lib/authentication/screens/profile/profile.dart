import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/authentication/screens/profile/widgets/changename.dart';
import 'package:yo_chat/authentication/screens/profile/widgets/profile_menu.dart';
import 'package:yo_chat/common/widgets/Headings/SectionHeading.dart';
import 'package:yo_chat/common/widgets/appbar/appbar.dart';
import 'package:yo_chat/common/widgets/custom_shapes/circular_image/circular_image.dart';
import 'package:yo_chat/common/widgets/loader/shimmer.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/constants/sizes.dart';

import '../../controllers/user/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  final controller = UserController.instance;
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: const YoAppBar(showBackarrow: true, title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YoAppSize.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : YoAppImages.user;
                  
                      return controller.imageUploading.value ? const ShimmerEffect(width: 80, height: 80, radius: 80) : CircularImage(
                          image: image,
                          width: 80,
                          height: 80,
                          isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                      onPressed: () => controller.selectPhoto(context),
                      child: const Text('Change Profile Picture'),
                    )
                  ],
                ),
              ),
              const SizedBox(height: YoAppSize.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: YoAppSize.spaceBtwItems),
              const SectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(height: YoAppSize.spaceBtwItems),
              ProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              ProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () {},
              ),
              const SizedBox(height: YoAppSize.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: YoAppSize.spaceBtwItems),
              const SectionHeading(
                title: "Personal Information",
                showActionButton: false,
              ),
              const SizedBox(height: YoAppSize.spaceBtwItems),
              ProfileMenu(
                title: 'UserID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: YoAppSize.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text('Close Account',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w500))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
