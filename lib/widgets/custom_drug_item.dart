import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pharmascan/Models/drug_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';

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
            
            SizedBox(width: 10.w),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                SizedBox(height: 5.h),

                Text(
                  widget.drugModel.name,
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 5.h),

                Text(
                  '${widget.drugModel.price} EGP',
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),

            const Spacer(),
      
            Column(
              children: [ 
                SizedBox(height: 5.h),

                BarcodeWidget(
                  height: 45.h,
                  width: 90.w,
                  data: widget.drugModel.barCode, 
                  barcode: Barcode.code128(),
                ),

                const Spacer(), 

                GestureDetector(
                  onTap: (){},
                  child: Container( 
                    height: 35.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(9), bottomRight: Radius.circular(7)),
                    ),
                  
                    child: Row(
                      spacing: 5.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(MingCute.shopping_bag_1_fill, color: AppColors.white, size: 25.h), 
                    
                        Text('Add to cart', style: AppStyles.pharmaScan13BoldWhite),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
