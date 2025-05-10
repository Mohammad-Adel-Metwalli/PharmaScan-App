import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmascan/Models/drug_model.dart';
import 'package:pharmascan/utils/app_colors.dart';

class DrugDetailsScreen extends StatefulWidget 
{
  const DrugDetailsScreen({super.key, required this.drugModel});
  final DrugModel drugModel;

  @override
  State<DrugDetailsScreen> createState() => _DrugDetailsScreenState();
}

class _DrugDetailsScreenState extends State<DrugDetailsScreen> 
{ 


  @override
  Widget build(BuildContext context) 
  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          children: [ 
            SizedBox(height: 20.h),
      
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.blue,
                  child: InkWell(
                    onTap: () => Navigator.pop(context), 
                    child: Icon(Icons.chevron_left_rounded, color: AppColors.white, size: 30.h),
                  ),
                ),
              ],
            ),
      
            Center(
              child: Container(
                height: 40.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(100),
                ),
        
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () => setState(() => widget.drugModel.quantity == 0 ? null : --widget.drugModel.quantity), icon: Icon(CupertinoIcons.minus_circle_fill, color: AppColors.white, size: 25.h)),
                
                    Text(
                      widget.drugModel.quantity.toString(),
                      style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                
                    IconButton(onPressed: () => setState(() => ++widget.drugModel.quantity), icon: Icon(CupertinoIcons.add_circled_solid, color: AppColors.white, size: 25.h)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}