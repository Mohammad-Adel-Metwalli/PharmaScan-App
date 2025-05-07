import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget
{
  const CustomButton({super.key, this.onPressed, required this.buttonColor, required this.buttonBody, this.height = 65, this.width = double.infinity});
  final void Function()? onPressed;
  final double height, width;
  final Color buttonColor;
  final Widget buttonBody;

  @override
  Widget build(BuildContext context) => MaterialButton(
    height: height.h,
    minWidth: width.w,
    color: buttonColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    onPressed: onPressed,
    child: buttonBody,
  );
}