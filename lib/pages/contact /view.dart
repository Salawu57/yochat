import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:yo_chat/common/widgets/appbar/appbar.dart';
import 'package:yo_chat/pages/contact%20/controller.dart';
import 'package:yo_chat/pages/contact%20/widget/contact_list.dart';
import 'package:yo_chat/utils/constants/sizes.dart';

import '../../common/widgets/custom_shapes/containers/search_container.dart';

class ContactPage extends StatelessWidget{
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: YoAppBar(
        title: Text('Chats', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: const ContactList()
    );
  }
}
