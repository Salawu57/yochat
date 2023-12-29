import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yo_chat/utils/constants/colors.dart';
import 'package:yo_chat/utils/msgContent/msgcontent.dart';

Widget ChatRightItem(Msgcontent item) {
  return Container(
    padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 230,
            minHeight: 40,
          ),
          child: Container(
            margin: const EdgeInsets.only(right: 10, top: 0),
            padding:
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            decoration: const BoxDecoration(
              color: YoColors.accent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: item.type == "text"
                ? Text("${item.content}")
                : ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 90,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: CachedNetworkImage(
                        imageUrl: "${item.content}",
                      ),
                    ),
                  ),
          ),
        )
      ],
    ),
  );
}
