import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmascan/utils/app_colors.dart';

class CustomCircularIndicator extends StatelessWidget 
{
  const CustomCircularIndicator({super.key, this.size = 60, this.color = AppColors.blue});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => SpinKitFadingCircle(color: color, size: size.h);
}