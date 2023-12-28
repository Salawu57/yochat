import 'package:flutter/material.dart';
import 'package:yo_chat/common/widgets/appbar/appbar.dart';
import 'package:yo_chat/pages/contact%20/widget/contact_list.dart';


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
