import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/authentication/screens/home/widgets/home_appbar.dart';
import 'package:yo_chat/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:yo_chat/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:yo_chat/utils/constants/sizes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContainer(
            child: Column(
              children: [
                HomeAppBar(),
                SizedBox(
                  height: YoAppSize.spaceBtwButton,
                ),
                SearchContainer(text:'Search Contact', icon: Iconsax.search_normal),

                 SizedBox(
                  height: YoAppSize.spaceBtwSections,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

