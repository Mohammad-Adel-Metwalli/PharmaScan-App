import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget
{
  const CustomButton({super.key, this.onPressed, required this.buttonColor, required this.buttonBody, this.height = 65, this.width = double.infinity, this.borderRadiusValue = 15,});
  final double height, width, borderRadiusValue; 
  final void Function()? onPressed;
  final Color buttonColor;
  final Widget buttonBody;

  @override
  Widget build(BuildContext context) => MaterialButton(
    height: height.h,
    minWidth: width.w,
    color: buttonColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadiusValue)),
    onPressed: onPressed,
    child: buttonBody,
  );
}