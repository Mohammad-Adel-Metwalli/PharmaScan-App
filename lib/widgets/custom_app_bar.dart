import 'package:flutter/material.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.onPressed});
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.blue,
      ),
      width: double.infinity,
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 35),
            onPressed: onPressed,
          ),
           SizedBox(width: 10),
           CircleAvatar(
            backgroundColor: AppColors.blue,
            radius: 40,
            backgroundImage: AssetImage(
              'assets/Person-Avatar.png',
            ), // Replace with your image path
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, 😊',
                style: AppTextStyles.text.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 5),
              Text(
                'Mr. Ahmed Fathy',
                style: AppTextStyles.text.copyWith(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
