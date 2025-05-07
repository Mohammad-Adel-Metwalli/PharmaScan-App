import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmascan/Screens/authentication_screen.dart';
import 'package:pharmascan/firebase_options.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      designSize: Size(MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),

      child: MaterialApp(
        home: StartScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}