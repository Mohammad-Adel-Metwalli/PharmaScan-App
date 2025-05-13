import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmascan/Cubits/Cart-Cubit/cubit/cart_cubit.dart';
import 'package:pharmascan/Helpers/firebase_helper.dart';
import 'package:pharmascan/Helpers/hive_helper.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/Screens/authentication_screen.dart';
import 'package:pharmascan/Screens/home_screen.dart';

void main() async
{ 
  await HiveHelper.hiveConfiguration(); 
  await FirebaseHelper.firebaseConfiguration();
  runApp(const PharmaScanApp());
}

class PharmaScanApp extends StatelessWidget
{
  const PharmaScanApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    UserModel userModel = HiveHelper.fetchUserProfile();

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      designSize: Size(MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),

      child: BlocProvider(
        create: (context) => CartCubit(),
        child: MaterialApp(
          home: userModel.isLoggedIn ? HomeScreen(userModel: userModel) : AuthenticationScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}