import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmascan/utils/app_colors.dart';

class Activation extends StatelessWidget {
  const Activation({
    super.key,
    this.height = 15,
    this.width = 15,
    this.borderWidth = 2,
  });
  final double height, width, borderWidth;

  @override
  Widget build(BuildContext context) => Container(
    height: height.h,
    width: width.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.green,
      border: Border.all(color: AppColors.white, width: borderWidth),
    ),
  );
}
