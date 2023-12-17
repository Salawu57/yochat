import 'package:flutter/material.dart';
import 'package:yo_chat/authentication/screens/profile/widgets/profile_menu.dart';
import 'package:yo_chat/common/widgets/Headings/SectionHeading.dart';
import 'package:yo_chat/common/widgets/appbar/appbar.dart';
import 'package:yo_chat/common/widgets/custom_shapes/circular_image/circular_image.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const CircularImage(
                        image: YoAppImages.user, width: 80, height: 80),
                    TextButton(
                      onPressed: () {},
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
                value: 'Babatunde Afees',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Username',
                value: 'fisco57',
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
                value: '13434',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'E-mail',
                value: 'fisco57@gmail.com',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Phone Number',
                value: '+23480384934923',
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
                    onPressed: () {},
                    child: const Text('Close Account',
                    style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
