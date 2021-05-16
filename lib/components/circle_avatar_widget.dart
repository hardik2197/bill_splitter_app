import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget(
      {this.image,
      this.borderWidth,
      this.borderColor,
      this.backgroundColor,
      this.size});

  final String image;
  final double borderWidth;
  final Color borderColor;
  final Color backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(width: borderWidth, color: borderColor)),
        child: Image.asset(
          image,
        ));
  }
}
