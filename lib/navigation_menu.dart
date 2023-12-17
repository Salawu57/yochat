import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/authentication/screens/chat/chat_contact.dart';
import 'package:yo_chat/authentication/screens/notification/notifications.dart';
import 'package:yo_chat/authentication/screens/settings/settings.dart';
import 'package:yo_chat/authentication/screens/status/status.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    final darkMode = YoHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
              height: 55,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              backgroundColor: darkMode ? YoColors.black : Colors.white,
              indicatorColor: darkMode
                  ? YoColors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.1),
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.message), label: 'Chat'),
                NavigationDestination(
                    icon: Icon(Iconsax.status), label: 'Status'),
                NavigationDestination(
                    icon: Icon(Iconsax.notification), label: 'Notifications'),
                NavigationDestination(
                    icon: Icon(Iconsax.user), label: 'Profile'),
              ],
            ),
           ),

           body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const ChatContactsScreen(),
    const StatusScreen(),
    const NotificationScreen(),
    const SettingsScreen(),
  ];
}
