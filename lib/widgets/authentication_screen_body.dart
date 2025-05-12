import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/widgets/person_avatar.dart';
import '../Screens/auth_bottom_sheet.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';

class AuthenticationScreenBody extends StatefulWidget
{
  const AuthenticationScreenBody({super.key,});

  @override
  State<AuthenticationScreenBody> createState() => _AuthenticationScreenBodyState();
}

class _AuthenticationScreenBodyState extends State<AuthenticationScreenBody> 
{
  ValueNotifier<bool> isLoginForm = ValueNotifier(true);

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50.h),
      
            PersonAvatar(),
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'PharmaScan',
                style: AppStyles.pharmaScan40Weight600White,
                textAlign: TextAlign.center,
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your Scan Smart, Stay Safe Your Health, One Scan Away.',
                style: AppStyles.pharmaScan20Weight600White,
                textAlign: TextAlign.center,
              ),
            ),
      
            const Spacer(),
      
            FadeInUpBig(
              delay: Duration(milliseconds: 1150),
              child: CustomButton(
                buttonColor: AppColors.white,
                buttonBody: Center(child: Text('Start Now!', style: AppStyles.pharmaScan24BoldBlack)),
                onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
                    child: ValueListenableBuilder(
                      valueListenable: isLoginForm,
                      builder: (context, notifier, _) => AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: isLoginForm.value ? 470.h : 660.h,
                        width: double.infinity,
                        decoration: BoxDecoration( 
                          color: AppColors.white, 
                          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                        ),
                        child: AuthBottomSheet(isLoginForm: isLoginForm), 
                      ),
                    ),
                  ),
                ).then((_) => isLoginForm.value = true),
              ),
            ),
      
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}