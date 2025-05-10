import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pharmascan/Helpers/firebase_helper.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/Screens/home_screen.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/assets_data.dart';
import 'package:pharmascan/widgets/custom_button.dart';
import 'package:pharmascan/widgets/custom_circular_indicator.dart';
import 'package:pharmascan/widgets/custom_drag_handle.dart';
import 'package:pharmascan/widgets/custom_drop_down_form_field.dart';
import 'package:pharmascan/widgets/custom_text_form_field.dart';

class AuthBottomSheet extends StatefulWidget
{
  const AuthBottomSheet({super.key, required this.isLoginForm});
  final ValueNotifier<bool> isLoginForm;

  @override
  State<AuthBottomSheet> createState() => _AuthBottomSheetState();
}

class _AuthBottomSheetState extends State<AuthBottomSheet>
{
  PageController? pageController = PageController(); 
  UserModel userModel = UserModel('', email: '');
  GlobalKey<FormState> formKey = GlobalKey(); 
  bool isObscured = true, isLoading = false;

  @override
  Widget build(BuildContext context)
  {
    return Form(
      key: formKey,
      child: PageView(
        controller: pageController,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              spacing: 10.h,
              children: [ 
                SizedBox(height: 10.h),
            
                CustomDragHandle(height: 10, width: 100),
            
                SizedBox(height: 20.h),
            
                CustomTextFormField(
                  label: 'email',
                  suffixIcon: null,
                  prefixIcon: Icon(Bootstrap.person_circle, color: AppColors.blue), 
                  onChanged: (data) => setState(() => userModel.email = data),
                ), 
            
                CustomTextFormField(
                  label: 'password',
                  isObscured: isObscured,
                  prefixIcon: Icon(Clarity.shield_check_solid, color: AppColors.blue), 
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => isObscured = !isObscured), 
                    icon: Icon(isObscured ? FontAwesome.eye_solid : FontAwesome.eye_slash_solid),
                  ),
                  onChanged: (data) => setState(() => userModel.setPassword = data),
                ),
            
                SizedBox(height: 15.h),
            
                isLoading ? CustomCircularIndicator() : CustomButton(
                  buttonColor: AppColors.blue, 
                  buttonBody: Center(child: Text('Login', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: AppColors.white, fontSize: 22.sp))),
                  onPressed: () async
                  { 
                    if(formKey.currentState!.validate())
                    {
                      setState(() => isLoading = !isLoading);
                      await FirebaseHelper.authentication(userModel: userModel, context: context); 
                      if(context.mounted)
                      { 
                        Navigator.pop(context); 
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                      } 
                      setState(() => isLoading = !isLoading); 
                    }
                  },
                ),
            
                SizedBox(height: 15.h), 
            
                Row(
                  spacing: 20.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomDragHandle(height: 4, width: 100), 
            
                    Text('OR', style: GoogleFonts.poppins(fontWeight: FontWeight.w300, color: AppColors.black, fontSize: 18.sp)),
            
                    CustomDragHandle(height: 4, width: 100), 
                  ],
                ),
            
                TextButton(
                  onPressed: () 
                  {
                    pageController?.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                    widget.isLoginForm.value = false;
                  },
                  child: RichText( 
                    text: TextSpan(
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black),
                      children: [
                        TextSpan(text: 'Don\'t have an account? '), 
                        TextSpan(text: 'Register Now!', style: GoogleFonts.poppins(decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          SingleChildScrollView( 
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column( 
              spacing: 10.h, 
              children: [ 
                SizedBox(height: 10.h),
            
                CustomDragHandle(height: 10, width: 100),
            
                SizedBox(height: 20.h),
            
                CustomTextFormField(
                  label: 'username',
                  suffixIcon: null,
                  prefixIcon: Icon(Bootstrap.person_circle, color: AppColors.blue), 
                  onChanged: (data) => setState(() => userModel.username = data),
                ),
            
                CustomTextFormField(
                  label: 'email',
                  suffixIcon: null,
                  prefixIcon: Icon(Bootstrap.person_circle, color: AppColors.blue), 
                  onChanged: (data) => setState(() => userModel.email = data),
                ), 
            
                CustomTextFormField(
                  label: 'password',
                  isObscured: isObscured,
                  prefixIcon: Icon(Clarity.shield_check_solid, color: AppColors.blue), 
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => isObscured = !isObscured), 
                    icon: Icon(isObscured ? FontAwesome.eye_solid : FontAwesome.eye_slash_solid),
                  ),
                  onChanged: (data) => setState(() => userModel.setPassword = data),
                ),

                CustomDropDownFormField(
                  label: 'City',
                  items: AssetsData.governoratesOfEgypt,
                  onChanged: (data) => setState(() => userModel.city = data!),
                  prefixIcon: Icon(Clarity.world_solid, color: AppColors.blue),
                ),
            
                SizedBox(height: 15.h),
            
                isLoading ? CustomCircularIndicator() : CustomButton(
                  buttonColor: AppColors.blue, 
                  buttonBody: Center(child: Text('Register', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: AppColors.white, fontSize: 22.sp))),
                  onPressed: () async
                  { 
                    if(formKey.currentState!.validate()) 
                    { 
                      setState(() => isLoading = !isLoading); 
                      await FirebaseHelper.registeration(userModel: userModel, context: context); 
                      if(context.mounted) 
                      {  
                        Navigator.pop(context);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                      } 
                      setState(() => isLoading = !isLoading);
                    }
                  },
                ),
            
                SizedBox(height: 15.h), 
            
                Row(
                  spacing: 20.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomDragHandle(height: 4, width: 100), 
            
                    Text('OR', style: GoogleFonts.poppins(fontWeight: FontWeight.w300, color: AppColors.black, fontSize: 18.sp)),
            
                    CustomDragHandle(height: 4, width: 100), 
                  ],
                ),
            
                TextButton(
                  onPressed: ()
                  {
                    pageController?.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                    widget.isLoginForm.value = true;
                  },
                  child: RichText( 
                    text: TextSpan(
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black),
                      children: [
                        TextSpan(text: 'Already have an account? '), 
                        TextSpan(text: 'Login Now!', style: GoogleFonts.poppins(decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}