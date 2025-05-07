import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';

class CustomDropDownFormField extends StatelessWidget
{
  const CustomDropDownFormField({super.key, required this.label, required this.prefixIcon, this.onChanged, this.currentValue, this.items = const [], this.isReadOnly = false});
  final String label; 
  final bool isReadOnly; 
  final Widget prefixIcon; 
  final List<String> items; 
  final String? currentValue;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context)
  {
    return DropdownButtonFormField<String>(
      itemHeight: 50.h,
      isExpanded: true, 
      value: currentValue,
      dropdownColor: AppColors.white,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      icon: Icon(CupertinoIcons.arrow_down_circle, size: 20.h, color: AppColors.black),
      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      validator: (data)
      {
        if(data == null)
        {
          return 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        label: Text(label, style: GoogleFonts.poppins(color: AppColors.black, fontSize: 13.sp, fontWeight: FontWeight.w500)),
        border: AppStyles.customOutlineInputBorderGrey(), 
        disabledBorder: AppStyles.customOutlineInputBorderGrey(),
        enabledBorder: AppStyles.customOutlineInputBorderBlue(),
        focusedBorder: AppStyles.customOutlineInputBorderBlue(), 
      ),
      items: List.generate(items.length, (index) => DropdownMenuItem<String>(value: items[index], child: Text(items[index], style: GoogleFonts.poppins(color: AppColors.black, fontSize: 13.sp, fontWeight: FontWeight.w500)))),
      onChanged: isReadOnly ? null : onChanged,
    );
  }
}