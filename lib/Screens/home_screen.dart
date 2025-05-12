import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pharmascan/Helpers/firebase_helper.dart';
import 'package:pharmascan/Models/drug_model.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/Screens/drug_details_screen.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/widgets/custom_drawer.dart';
import 'package:pharmascan/widgets/home_screen_body.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({super.key, required this.userModel}); 
  final UserModel userModel; 

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
{ 
  String scanBarCodeResult = 'Unknown';

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      drawer: CustomDrawer(userModel: widget.userModel),
      backgroundColor: AppColors.white,
      body: HomeScreenBody(userModel: widget.userModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () async
        {
          String? result = await SimpleBarcodeScanner.scanBarcode(
            context, 
            cameraFace: CameraFace.front, 
          );

          setState(() => scanBarCodeResult = result ?? 'Unknown');
          DrugModel scannedDrug = await FirebaseHelper.fetchDrug(barCode: scanBarCodeResult);
          if(context.mounted)
          { 
            Navigator.push(context, MaterialPageRoute(builder: (context) => DrugDetailsScreen(drugModel: scannedDrug)));
          }
        },
        backgroundColor: AppColors.blue,
        child: Icon(Iconsax.scan_bold, color: AppColors.white, size: 30.h),
      ),
    );
  } 
}