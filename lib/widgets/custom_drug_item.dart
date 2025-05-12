import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmascan/Models/drug_model.dart';
import 'package:pharmascan/utils/app_colors.dart';

class CustomDrugItem extends StatefulWidget 
{
  const CustomDrugItem({super.key, required this.drugModel, this.onTap}); 
  final Function()? onTap;
  final DrugModel drugModel;

  @override
  State<CustomDrugItem> createState() => _CustomDrugItemState();
}

class _CustomDrugItemState extends State<CustomDrugItem> 
{
  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 110.h, 
        width: double.infinity, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.blue, width: 3),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 5.w),

            Image.asset('assets/Panadol.png', scale: 1.3), 
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                SizedBox(height: 5.h),

                Text(
                  widget.drugModel.name,
                  style: GoogleFonts.poppins(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 5.h),

                Text(
                  '${widget.drugModel.price.toStringAsFixed(2)} EGP',
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),

            const Spacer(),
      
            BarcodeWidget(
              height: 50.h,
              width: 100.w,
              data: widget.drugModel.barCode, 
              barcode: Barcode.code128(),
            ),

            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }
}