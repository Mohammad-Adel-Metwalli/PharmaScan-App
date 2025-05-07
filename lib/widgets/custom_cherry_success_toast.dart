import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pharmascan/utils/app_colors.dart';

CherryToast customCherrySuccessToast({required String successTitle, required String successMessage}) => CherryToast.success(
  backgroundColor: AppColors.white,
  animationType: AnimationType.fromTop,
  toastDuration: Duration(milliseconds: 4500),
  iconWidget: Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Icon(Iconsax.verify_bold, size: 30.h, color: AppColors.green),
  ),
  title: Text(successTitle, style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 20.sp, color: AppColors.black)),
  description: Text(successMessage, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15.sp, color: AppColors.black)),
);