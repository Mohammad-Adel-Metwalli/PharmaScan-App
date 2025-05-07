import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmascan/utils/app_colors.dart';

CherryToast customCherryErrorToast({required String errorTitle, required String errorMessage}) => CherryToast.error(
  backgroundColor: AppColors.white,
  animationType: AnimationType.fromTop,
  toastDuration: Duration(milliseconds: 4500),
  iconWidget: Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Icon(Icons.error_rounded, size: 30.h, color: AppColors.red),
  ),
  title: Text(errorTitle, style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 20.sp, color: AppColors.black)),
  description: Text(errorMessage, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15.sp, color: AppColors.black)),
);