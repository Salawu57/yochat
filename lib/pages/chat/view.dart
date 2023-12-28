import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yo_chat/common/widgets/Headings/SectionHeading.dart';
import 'package:yo_chat/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:yo_chat/common/widgets/list_tile/chatheader.dart';
import 'package:yo_chat/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/constants/sizes.dart';

class ChatPage extends StatelessWidget{
  const ChatPage({super.key, required this.fullname, required this.email, required this.photoUrl});


  final String fullname;
  final String email;
  final String photoUrl;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
               
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: YoAppSize.lg),
                    child: ChatHeaderTiles(
                         fullname:fullname, email: email, photoUrl: photoUrl,
                        onPressed: () => Navigator.pop(context)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      height: 50,
                      child: Container(
                        width: 360,
                        height: 50,
                        color: YoColors.accent,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 217,
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                autofocus: false,
                              ),
                            )
                          ],
                        )
                      ),
                    )
                  ],
                ),
              ),
            )
      
      
            
      
        
         
          ],
        ),
    );
  }
}
