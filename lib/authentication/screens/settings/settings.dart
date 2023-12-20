import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/authentication/screens/profile/profile.dart';
import 'package:yo_chat/common/widgets/Headings/SectionHeading.dart';
import 'package:yo_chat/common/widgets/appbar/appbar.dart';
import 'package:yo_chat/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:yo_chat/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:yo_chat/common/widgets/list_tile/user_profile_tile.dart';
import 'package:yo_chat/data/repositories/authentication/authentication_repository.dart';
import 'package:yo_chat/utils/constants/colors.dart';

import 'package:yo_chat/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  YoAppBar(
                      title: Text('Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: YoColors.white))),
                  UserProfileTiles(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(
                    height: YoAppSize.spaceBtwSections,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(YoAppSize.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: YoAppSize.spaceBtwItems),
                  SettingsMenuTile(
                      icon: Iconsax.user,
                      title: 'Account',
                      subtitle: 'Manage',
                      onTop: () {}),
                  SettingsMenuTile(
                      icon: Iconsax.message,
                      title: 'Chat',
                      subtitle: 'Manage messages',
                      onTop: () {}),
                  SettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notification',
                      subtitle: 'Set any kind of notification message',
                      onTop: () {}),
                  SettingsMenuTile(
                      icon: Iconsax.security,
                      title: 'Privacy',
                      subtitle: 'Manage data usage and connected accounts',
                      onTop: () {}),
                  SettingsMenuTile(
                      icon: Iconsax.support,
                      title: 'Help',
                      subtitle: '24/7 support',
                      onTop: () {}),
                  const SizedBox(
                    height: YoAppSize.spaceBtwSections,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: ()  => AuthenticationRepository.instance.logout(), child: const Text('Logout'))),
                  // const SizedBox(
                  //   height: YoAppSize.spaceBtwSections * 2.5)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
