import 'package:flutter/material.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_text_styles.dart';
import 'package:pharmascan/widgets/custom_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: AppColors.blue,
              radius: 45,
              backgroundImage: AssetImage(
                'assets/Person-Avatar.png',
              ), // Replace with your image path
            ),
            const SizedBox(height: 5),
            Text(
              'Mr. Ahmed Fathy',
              style: AppTextStyles.text.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.white),
                Text(
                  'Alexandria',
                  style: AppTextStyles.text.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Container(height: 4, width: 250, color: Colors.white),
            const SizedBox(height: 20),
            CustomButton(
              color: Colors.white,
              width: 250,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.home_outlined, color: AppColors.blue),
                  const SizedBox(width: 10),
                  Text(
                    'Home',
                    style: AppTextStyles.text.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios, color: AppColors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CustomButton(
              color: Colors.white,
              width: 250,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.shopping_bag_outlined, color: AppColors.blue),
                  const SizedBox(width: 10),
                  Text(
                    'My Cart',
                    style: AppTextStyles.text.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios, color: AppColors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CustomButton(
              color: Colors.white,
              width: 250,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Image.asset('assets/Group 21.png', scale: 0.9),
                  const SizedBox(width: 10),
                  Text(
                    'Drugs',
                    style: AppTextStyles.text.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios, color: AppColors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CustomButton(
              color: Colors.white,
              width: 250,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.history, color: AppColors.blue),
                  const SizedBox(width: 10),
                  Text(
                    'History',
                    style: AppTextStyles.text.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios, color: AppColors.blue),
                  ),
                ],
              ),
            ),
            Spacer(),
            /////////////////////////////////////
            Text(
              'DEPI©2025',
              style: AppTextStyles.text.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomButton(
              color: Colors.white,
              width: 250,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.settings_outlined, color: AppColors.blue),
                  const SizedBox(width: 10),
                  Text(
                    'Settings',
                    style: AppTextStyles.text.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios, color: AppColors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CustomButton(
              color: Colors.white,
              width: 250,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.logout, color: AppColors.blue),
                  const SizedBox(width: 10),
                  Text(
                    'Home',
                    style: AppTextStyles.text.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios, color: AppColors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
