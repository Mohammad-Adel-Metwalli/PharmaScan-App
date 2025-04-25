import 'package:flutter/material.dart';
import 'package:pharmascan/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.color,
    this.onTap,
    this.width = 380,
    this.height = 65,
    required this.child,
  });
  final color;
  void Function()? onTap;
  final double width;
  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
