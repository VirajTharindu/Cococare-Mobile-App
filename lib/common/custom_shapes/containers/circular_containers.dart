import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CCircularContainer extends StatelessWidget {
  const CCircularContainer({
    super.key,
    this.child,
    this.width = 450,
    this.height = 350,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = CColors.secondaryColor,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
