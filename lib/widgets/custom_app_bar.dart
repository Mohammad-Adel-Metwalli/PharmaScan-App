import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';
import 'package:pharmascan/widgets/activation.dart';
import 'package:pharmascan/widgets/custom_button.dart';

class CustomAppBar extends StatelessWidget 
{
  const CustomAppBar({super.key, required this.userModel,});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) 
  {
    return Container( 
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration( 
        color: AppColors.blue, 
        borderRadius: BorderRadius.circular(25.r),
      ),

      child: Row(
        children: [ 
          SizedBox(width: 20.w),  

          CustomButton( 
            height: 55.h,
            width: 55.w,
            buttonColor: AppColors.white, 
            onPressed: () => Scaffold.of(context).openDrawer(),
            buttonBody: Icon(MingCute.menu_fill, color: AppColors.black),
          ), 

          SizedBox(width: 10.w),

          Stack(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, 
                  color: AppColors.blue, 
                  border: Border.all(color: AppColors.white, width: 2),
                  image: DecorationImage(image: AssetImage('assets/Person-Avatar.png'), fit: BoxFit.cover),
                ),
              ),

              Positioned(
                right: 7.w,
                bottom: 10.h,
                child: Activation(),
              ),
            ],
          ),
          
          SizedBox(width: 10.w),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello, 😊', style: AppStyles.pharmaScan18Weight700White), 
              
              SizedBox(height: 2.h),

              Text('Mr. ${userModel.username}', style: AppStyles.pharmaScan20Weight700White, overflow: TextOverflow.ellipsis, maxLines: 1),
            ],
          ),
        ],
      ),
    );
  }
}