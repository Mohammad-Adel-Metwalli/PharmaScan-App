import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:pharmascan/Models/orders_history_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';

class OrdersHistoryItem extends StatelessWidget
{
  const OrdersHistoryItem({super.key, required this.historyModel});
  final OrdersHistoryModel historyModel;

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: 300.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey, width: 2),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Iconsax.calendar_bold, color: AppColors.orange, size: 30.h), 
              
              Text(DateFormat('MMM d, y - hh:mm:ss a').format(historyModel.orderDate.toDate()), style: AppStyles.pharmaScan12BoldBlack), 
              
              const Spacer(),

              Container(
                height: 25.h, 
                width: 70.w,
                decoration: BoxDecoration( 
                  borderRadius: BorderRadius.circular(5), 
                  color: AppColors.green,
                ),

                child: Center(child: Text('Delivered', style: AppStyles.pharmaScan11BoldWhite)),
              ), 
            ],
          ),

          SizedBox(height: 10.h),

          Row(
            spacing: 5.w,
            children: [
              Icon(MingCute.shopping_bag_1_fill, color: AppColors.orange, size: 30.h), 

              Text(historyModel.orderNumber, style: AppStyles.pharmaScan12BoldBlack),

              const Spacer(),
              
              Text('Bill: ${historyModel.totalPrice} EGP', style: AppStyles.pharmaScan15Boldlack),
            ],
          ),
        ],
      ),
    );
  }
}
