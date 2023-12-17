
import 'package:flutter/material.dart';
import 'package:yo_chat/utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.child,
    this.width = 300,
    this.height = 300,
    this.radius = 300,
    this.padding = 0,
    this.backgroundColor = YoColors.white,
  });

  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
