import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget 
{
  const CustomButton({super.key, required this.color, required this.text, this.onTap, this.width = 380, this.height = 65, this.textStyle,});
  final Color color;
  final Function()? onTap;
  final String text;
  final double width;
  final double height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(text, style: textStyle)),
      ),
    );
  }
}