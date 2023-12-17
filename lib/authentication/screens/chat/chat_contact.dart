import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/common/widgets/appbar/appbar.dart';
import 'package:yo_chat/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:yo_chat/utils/constants/sizes.dart';

class ChatContactsScreen extends StatelessWidget {
  const ChatContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YoAppBar(
        title: Text('Chats', style: Theme.of(context).textTheme.headlineMedium),
        ),

        body: const SingleChildScrollView(
          child: Column(children: [
             SizedBox(
                  height: YoAppSize.spaceBtwButton,
                ),
                SearchContainer(text:'Search Contact', showborder: true, icon: Iconsax.search_normal, showBackground: false),
          ],)
        ) ,
    );
  }
}