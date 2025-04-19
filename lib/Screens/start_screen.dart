import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmascan/Screens/auth_screen.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_text_styles.dart';
import 'package:pharmascan/widgets/custom_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: CircleAvatar(
                        radius: 130,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
                SizedBox(height: 20),
                Image.asset('assets/save.png', scale: 11),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'PharmaScan',
              style: AppTextStyles.pharmaScan,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Scan Smart, Stay Safe Your Health, One Scan Away.',
              style: AppTextStyles.text,
              textAlign: TextAlign.center,
            ),
          ),

          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: CustomButton(
              textStyle: AppTextStyles.text.copyWith(
                color: Colors.black,
                fontSize: 24,
              ),
              color: Colors.white,
              text: 'Start Now',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  builder: (context) => const AuthScreen(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
