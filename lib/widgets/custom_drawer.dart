import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pharmascan/Helpers/hive_helper.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/Screens/authentication_screen.dart';
import 'package:pharmascan/Screens/cart_screen.dart';
import 'package:pharmascan/Screens/drugs_screen.dart';
import 'package:pharmascan/Screens/orders_history.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';
import 'package:pharmascan/widgets/activation.dart';
import 'package:pharmascan/widgets/custom_button.dart';

class CustomDrawer extends StatelessWidget
{
  const CustomDrawer({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      backgroundColor: AppColors.blue,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              
              Center(
                child: Stack(
                  children: [
                    Container( 
                      height: 125.h, 
                      width: 125.w, 
                      decoration: BoxDecoration( 
                        shape: BoxShape.circle, 
                        color: AppColors.blue, 
                        border: Border.all(color: AppColors.white, width: 2), 
                        image: DecorationImage(image: AssetImage('assets/Person-Avatar.png'), fit: BoxFit.cover), 
                      ), 
                    ),
                
                    Positioned(
                      bottom: 10.h,
                      right: 10.w,
                      child: Activation(
                        height: 20,
                        width: 20,
                        borderWidth: 3,
                      ), 
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 10.h),
          
              Center(
                child: Text(
                  'Mr. ${userModel.username}',
                  style: AppStyles.pharmaScan22Weight700White,
                ),
              ), 
              
              SizedBox(height: 10.h),
          
              Row(
                spacing: 5.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Icon(Icons.location_on_sharp, color: Colors.white),
                  Text(
                    userModel.city,
                    style: AppStyles.pharmaScan20Weight600White,
                  ),
                ],
              ), 

              SizedBox(height: 10.h),
          
              Row(
                spacing: 5.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Icon(EvaIcons.phone_call, color: Colors.white),
                  Text(
                    '+2${userModel.phoneNumber}',
                    style: AppStyles.pharmaScan20Weight600White,
                  ),
                ],
              ), 
              
              SizedBox(height: 5.h), 
          
              Divider(
                thickness: 4.h,
                indent: 15.w,
                endIndent: 15.w,
                color: AppColors.white,
              ),
          
              SizedBox(height: 20.h),
          
              CustomButton(
                onPressed: () 
                {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(userModel: userModel)));
                },
                buttonColor: AppColors.white, 
                buttonBody: Row(
                  spacing: 10.w,
                  children: [         
                    Icon(MingCute.shopping_bag_1_fill, color: AppColors.blue), 
          
                    Text(
                      'My Cart',
                      style: AppStyles.pharmascan20BoldBlue, 
                    ),
          
                    const Spacer(),
          
                    Icon(Icons.chevron_right_rounded, color: AppColors.blue, size: 30.h),
                  ],
                ),
              ),
          
              SizedBox(height: 10.h),
          
              CustomButton(
                onPressed: () 
                {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DrugsScreen(userModel: userModel)));
                },
                buttonColor: AppColors.white, 
                buttonBody: Row(
                  spacing: 10.w,
                  children: [         
                    Image.asset('assets/Group 21.png', scale: 0.9), 
          
                    Text(
                      'Drugs',
                      style: AppStyles.pharmascan20BoldBlue, 
                    ),
          
                    const Spacer(),
          
                    Icon(Icons.chevron_right_rounded, color: AppColors.blue, size: 30.h),
                  ],
                ),
              ), 
              
              SizedBox(height: 10.h),
          
              CustomButton(
                onPressed: () 
                {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersHistory(userModel: userModel)));
                },
                buttonColor: AppColors.white, 
                buttonBody: Row(
                  spacing: 10.w,
                  children: [         
                    Icon(Icons.history, color: AppColors.blue, size: 30.h), 
          
                    Text(
                      'Orders History',
                      style: AppStyles.pharmascan20BoldBlue, 
                    ),
          
                    const Spacer(),
          
                    Icon(Icons.chevron_right_rounded, color: AppColors.blue, size: 30.h),
                  ],
                ),
              ),
          
              const Spacer(),

              Text(
                'DEPI©2025',
                style: AppStyles.pharmaScan20Weight600White,
              ), 

              SizedBox(height: 10.h),

              CustomButton(
                onPressed: () 
                {
                  HiveHelper.logout(userModel: userModel);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AuthenticationScreen()));
                },
                buttonColor: AppColors.white, 
                buttonBody: Row(
                  spacing: 10.w,
                  children: [         
                    Icon(IonIcons.log_out, color: AppColors.blue, size: 30.h), 
          
                    Text(
                      'Logout',
                      style: AppStyles.pharmascan20BoldBlue, 
                    ),
          
                    const Spacer(),
          
                    Icon(Icons.chevron_right_rounded, color: AppColors.blue, size: 30.h),
                  ],
                ),
              ), 
              
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
