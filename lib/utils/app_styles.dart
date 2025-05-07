import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmascan/utils/app_colors.dart';

class AppStyles
{
  static TextStyle pharmaScan40Weight600White = GoogleFonts.poppins(
    fontSize: 40.sp,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle pharmaScan20Weight600White = GoogleFonts.poppins(
    fontSize: 20.sp,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle pharmaScan24BoldBlack = GoogleFonts.poppins(
    fontSize: 24.sp,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle pharmaScan16BoldCustomBoldGrey = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.customBoldGrey,
  );

  static TextStyle pharmaScan16Blue = GoogleFonts.poppins(
    fontSize: 16.sp,
    color: AppColors.blue,
  );

  static TextStyle pharmaScan14Weight400CustomBoldGrey70 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.customBoldGrey.withValues(alpha: 0.7),
  );

  static TextStyle pharmaScan11BoldWhite = GoogleFonts.poppins(
    fontSize: 11.sp,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle pharmaScan10BoldWhite = GoogleFonts.poppins(
    fontSize: 10.sp,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle pharmaScan11BoldBlack = GoogleFonts.poppins(
    fontSize: 11.sp,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle pharmaScan10Weight500Black = GoogleFonts.poppins(
    fontSize: 15.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );

  static OutlineInputBorder customOutlineInputBorderGrey() => OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.grey, width: 2));
  static OutlineInputBorder customOutlineInputBorderBlue() => OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.blue, width: 2)); 
}