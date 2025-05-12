import 'package:flutter/material.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/widgets/custom_drawer.dart';
import 'package:pharmascan/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget 
{
  const HomeScreen({super.key, required this.userModel}); 
  final UserModel userModel; 

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      drawer: CustomDrawer(userModel: userModel),
      backgroundColor: AppColors.white,
      body: HomeScreenBody(userModel: userModel),
      // floatingActionButton: FloatingActionButton(onPressed: onPressed),
    );
  }
}