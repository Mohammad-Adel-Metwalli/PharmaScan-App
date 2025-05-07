import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmascan/utils/app_colors.dart';

class PersonAvatar extends StatelessWidget
{
  const PersonAvatar({super.key,});

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.topCenter,
    children: [
      Positioned(
        top: 25.h,
        child: CircleAvatar(
          radius: 145.h,
          backgroundColor: AppColors.white,
        ),
      ),

      Image.asset('assets/save.png', scale: 10.h),
    ],
  );
}