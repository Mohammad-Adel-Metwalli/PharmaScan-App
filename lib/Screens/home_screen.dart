import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async
        {
          String barCodeScanResult = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
        },
        backgroundColor: AppColors.blue,
        child: Icon(Iconsax.scan_bold, color: AppColors.white, size: 30.h),
      ),
    );
  }
}