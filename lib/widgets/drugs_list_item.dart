import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pharmascan/Helpers/firebase_helper.dart';
import 'package:pharmascan/Models/drug_model.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';
import 'package:pharmascan/widgets/custom_button.dart';
import 'package:pharmascan/widgets/custom_cherry_success_toast.dart';
import 'package:pharmascan/widgets/custom_drag_handle.dart';
import 'package:pharmascan/widgets/custom_text_form_field.dart';

class DrugsListItem extends StatefulWidget 
{
  const DrugsListItem({super.key, required this.drugModel, this.onTap, required this.userModel}); 
  final UserModel userModel;
  final DrugModel drugModel; 
  final Function()? onTap;

  @override
  State<DrugsListItem> createState() => _DrugsListItemState();
}

class _DrugsListItemState extends State<DrugsListItem> 
{ 
  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.blue, width: 3),
        ),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5.w),
            
                Image.asset('assets/Panadol.png', scale: 1.3, height: 120.h, width: 120.w), 
                
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
                      '${widget.drugModel.price.toStringAsFixed(2)} EGP',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue,
                      ),
                    ), 
                  ],
                ), 
              ],
            ), 

            SizedBox(height: 20.h), 
            
            widget.userModel.isAdmin ? Center(
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
                    IconButton(onPressed: () async => await FirebaseHelper.updateDrugQuantity(drugModel: widget.drugModel, isIncrement: false), icon: Icon(CupertinoIcons.minus_circle_fill, color: AppColors.white, size: 25.h)),
                  
                    Text(
                      widget.drugModel.quantity.toString(),
                      style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                  
                    IconButton(onPressed: () async => await FirebaseHelper.updateDrugQuantity(drugModel: widget.drugModel, isIncrement: true), icon: Icon(CupertinoIcons.add_circled_solid, color: AppColors.white, size: 25.h)),
                  ],
                ),
              ),
            ) : const SizedBox.shrink(), 

            widget.userModel.isAdmin ? SizedBox(height: 30.h) : const SizedBox.shrink(),

            widget.userModel.isAdmin ? Row(
              spacing: 10.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  height: 60.h,
                  width: 50.w,
                  onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: AppStyles.bottomSheetBorderRadius),
              builder: (context) => Container(
                height: 540.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppStyles.bottomSheetBorderRadius,
                ),

                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ListView( 
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    children: [
                      SizedBox(height: 10.h),
                    
                      Center(child: CustomDragHandle(height: 10, width: 100)), 
                  
                      SizedBox(height: 20.h),
                  
                      CustomTextFormField(
                        label: 'Name', 
                        suffixIcon: null, 
                        prefixIcon: Image.asset('assets/Group 21.png', scale: (0.8).h), 
                        onChanged: (data) => setState(() => widget.drugModel.name = data),
                      ),
                  
                      SizedBox(height: 10.h),
                  
                      CustomTextFormField(
                        label: 'Price', 
                        suffixIcon: null,
                        keyboardType: TextInputType.number,
                        prefixIcon: Icon(AntDesign.pound_circle_fill, color: AppColors.blue, size: 30.h), 
                        onChanged: (data) => setState(() => widget.drugModel.price = double.parse(data)),
                      ),
                  
                      SizedBox(height: 10.h),
                  
                      CustomTextFormField(
                        label: 'Quantity', 
                        suffixIcon: null, 
                        keyboardType: TextInputType.number,
                        prefixIcon: Icon(CupertinoIcons.number_circle, color: AppColors.blue, size: 30.h), 
                        onChanged: (data) => setState(() => widget.drugModel.quantity = int.parse(data)),
                      ),
                  
                      SizedBox(height: 10.h),
                  
                      CustomTextFormField(
                        label: 'ID', 
                        readOnly: true, 
                        suffixIcon: null,
                        initialValue: widget.drugModel.barCode,
                        prefixIcon: Icon(Iconsax.hospital_bold, color: AppColors.blue, size: 25.h), 
                      ),
                  
                      SizedBox(height: 10.h),
                  
                      CustomTextFormField( 
                        maxLines: 5,
                        suffixIcon: null,
                        label: 'Description',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(bottom: 90.h),
                          child: Icon(Iconsax.note_21_bold, color: AppColors.blue, size: 30.h),
                        ), 
                        onChanged: (data) => setState(() => widget.drugModel.description = data),
                      ), 
                      
                      SizedBox(height: 10.h), 
                  
                      CustomButton(
                        onPressed: () async
                        {
                          await FirebaseHelper.updateDrug(drugModel: widget.drugModel);
                          if(context.mounted)
                          {
                            customCherrySuccessToast(successTitle: 'Success Editing', successMessage: 'Drug Added Successfully!').show(context);
                            Navigator.pop(context);
                          }
                        },
                        buttonColor: AppColors.blue, 
                        buttonBody: Center(child: Text('Edit Drug', style: AppStyles.pharmaScan22Weight700White)),
                      ), 
                  
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
                  buttonColor: AppColors.blue, 
                  buttonBody: Center(child: Icon(Iconsax.edit_2_bold, color: AppColors.white, size: 30.h)),
                ),

                CustomButton(
                  height: 60.h,
                  width: 50.w,
                  onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: AppStyles.bottomSheetBorderRadius),
              builder: (context) => Container(
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppStyles.bottomSheetBorderRadius,
                ),

                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ListView( 
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    children: [
                      SizedBox(height: 10.h),
                    
                      Center(child: CustomDragHandle(height: 10, width: 100)), 
                  
                      SizedBox(height: 20.h), 

                      Center(child: Text('Are you sure you want to delete\n${widget.drugModel.name}?', style: AppStyles.pharmaScan24BoldBlack, textAlign: TextAlign.center)),

                      SizedBox(height: 10.h),

                      CustomButton(
                        onPressed: () async
                        {
                          await FirebaseHelper.deleteDrug(barCode: widget.drugModel.barCode);
                          if(context.mounted)
                          {
                            customCherrySuccessToast(successTitle: 'Success Deletion', successMessage: 'Drug deleted Successfully!').show(context);
                            Navigator.pop(context);
                          }
                        },
                        buttonColor: AppColors.green, 
                        buttonBody: Center(child: Text('Yes', style: AppStyles.pharmaScan22Weight700White)),
                      ), 

                      SizedBox(height: 10.h),

                      CustomButton(
                        onPressed: () => Navigator.pop(context),
                        buttonColor: AppColors.red, 
                        buttonBody: Center(child: Text('No', style: AppStyles.pharmaScan22Weight700White)),
                      ), 
                  
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
                  buttonColor: AppColors.red, 
                  buttonBody: Center(child: Icon(Iconsax.trash_bold, color: AppColors.white, size: 30.h)),
                ),
              ],
            ) : const SizedBox.shrink(),
            
            widget.userModel.isAdmin ? SizedBox(height: 30.h) : const SizedBox.shrink(),

            BarcodeWidget(
              height: 60.h,
              width: 250.w,
              data: widget.drugModel.barCode, 
              barcode: Barcode.code128(),
            ), 
            
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}