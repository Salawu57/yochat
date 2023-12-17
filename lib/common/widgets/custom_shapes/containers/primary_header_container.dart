import 'package:flutter/material.dart';
import 'package:yo_chat/common/widgets/custom_shapes/containers/circlur_container.dart';
import 'package:yo_chat/common/widgets/custom_shapes/curved_edges/curve_edges_widget.dart';
import 'package:yo_chat/utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: YoColors.primary,
        child: Stack(
          children: [
            Positioned(
                top: -100,
                right: -200,
                child: CircularContainer(
                  backgroundColor: YoColors.textWhite.withOpacity(0.1),
                )),
            Positioned(
                top: 50,
                right: -230,
                child: CircularContainer(
                  backgroundColor: YoColors.textWhite.withOpacity(0.1),
                ),
                ),
        
                child,
               
          ],
          
        ),
      ),
    );
  }
}
