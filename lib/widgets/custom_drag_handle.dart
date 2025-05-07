import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmascan/utils/app_colors.dart';

class CustomDragHandle extends StatelessWidget 
{
  const CustomDragHandle({super.key, required this.height, required this.width,});
  final double height, width;

  @override
  Widget build(BuildContext context) => Container( 
    height: height.h, 
    width: width.w, 
    decoration: BoxDecoration( 
      color: AppColors.customBoldGrey, 
      borderRadius: BorderRadius.circular(50), 
    ),
  );
}