import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmascan/utils/app_colors.dart';

class CustomCircularIndicator extends StatelessWidget 
{
  const CustomCircularIndicator({super.key,});

  @override
  Widget build(BuildContext context) => SpinKitFadingCircle(color: AppColors.blue, size: 60.h);
}