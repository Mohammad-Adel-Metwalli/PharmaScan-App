import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/utils/app_colors.dart';

class AdminSwitch extends StatefulWidget 
{
  const AdminSwitch({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<AdminSwitch> createState() => _AdminSwitchState();
}

class _AdminSwitchState extends State<AdminSwitch> 
{
  @override
  Widget build(BuildContext context) => Row(
    children: [
      CupertinoSwitch(
        value: widget.userModel.isAdmin, 
        activeTrackColor: AppColors.green,
        onChanged: (data) => setState(() => widget.userModel.isAdmin = data),
      ),

      Text('Admin', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 15.sp, color: AppColors.black)),
    ],
  );
}