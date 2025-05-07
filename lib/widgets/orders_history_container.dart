import 'package:flutter/material.dart';
import 'package:pharmascan/Models/orders_history_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';

class OrdersHistoryContainer extends StatelessWidget
{
  const OrdersHistoryContainer({super.key, required this.historyModel});
  final OrdersHistoryModel historyModel;

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: 70,
      width: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFBBB8B8), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.calendar_month, color: AppColors.orange, size: 20),
                const SizedBox(width: 5),
                Text(
                  historyModel.orderDate,
                  style: AppStyles.pharmaScan11BoldBlack,
                ),
                Spacer(),
                Container(
                  width: 60,
                  height: 20,
                  decoration: BoxDecoration(
                    color:
                        historyModel.orderStatus
                            ? AppColors.green
                            : AppColors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      historyModel.orderStatus ? 'Delivered' : 'Canceled',
                      style: AppStyles.pharmaScan10BoldWhite,
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColors.orange,
                  size: 20,
                ),
                SizedBox(width: 6),
                Text(
                  historyModel.orderId,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Text(
                  'Bill: ${historyModel.orderBill} EGP',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
