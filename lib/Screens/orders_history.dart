import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:pharmascan/Helpers/firebase_helper.dart';
import 'package:pharmascan/Models/orders_history_model.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';
import 'package:pharmascan/widgets/custom_circular_indicator.dart';

class OrdersHistory extends StatelessWidget 
{
  const OrdersHistory({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) 
  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          children: [ 
            SizedBox(height: 20.h),
        
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.blue,
                  child: InkWell(
                    onTap: () => Navigator.pop(context), 
                    child: Icon(Icons.chevron_left_rounded, color: AppColors.white, size: 30.h),
                  ), 
                ), 
        
                const Spacer(),
        
                Icon(Icons.history, color: AppColors.blue, size: 30.h), 
        
                SizedBox(width: 5.w), 
        
                Text('Orders History', style: GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.customBoldGrey)), 
                  
                const Spacer(flex: 2),
              ],
            ),

            // SizedBox(height: 20.h),

            StreamBuilder(
              stream: FirebaseHelper.fetchAllOrders(),
              builder: (context, snapshot) 
              {
                if(snapshot.hasData)
                {
                  List<QueryDocumentSnapshot<Map<String, dynamic>>> ordersCollection = snapshot.data!.docs.toList(); 
              List<OrdersHistoryModel> allOrders = ordersCollection.map((doc) => OrdersHistoryModel.fromFirestore(doc.data())).toList(); 

                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: allOrders.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => allOrders[index].email != userModel.email ? const SizedBox.shrink() : Container(
      width: 300.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
              
              Text(DateFormat('MMM d, y - hh:mm:ss a').format(allOrders[index].orderDate.toDate()), style: AppStyles.pharmaScan15Boldlack), 
              
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

              Text(allOrders[index].orderNumber, style: AppStyles.pharmaScan15Boldlack),

              const Spacer(),
              
              Text('Bill: ${allOrders[index].totalPrice} EGP', style: AppStyles.pharmaScan15Boldlack),
            ],
          ),

          SizedBox(height: 10.h),

          Divider(
            color: AppColors.blue,
            thickness: 3,
            indent: 50.w,
            endIndent: 50.w,
          ), 
          
          SizedBox(height: 10.h), 

          ListView.separated(
            shrinkWrap: true,
            itemCount: allOrders[index].order.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, innerIndex) => Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(allOrders[index].order[innerIndex].drugName, style: AppStyles.pharmaScan20BoldBlack), 
                        
                        SizedBox(width: 10.w),

                        Text('X ${allOrders[index].order[innerIndex].drugQuantity}', style: AppStyles.pharmaScan20BoldBlack), 
                      ],
                    ), 

                    SizedBox(height: 5.h),

                    Row(
                      children: [
                        Text('${allOrders[index].order[innerIndex].drugPrice} EGP', style: AppStyles.pharmaScan16BlueW700),

                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.35),
                        
                        Text('${(allOrders[index].order[innerIndex].drugPrice * allOrders[index].order[innerIndex].drugQuantity).toStringAsFixed(2)} EGP', style: AppStyles.pharmaScan16BlueW700),

                        SizedBox(width: 10.w),
                      ],
                    ),
                  ],
                ),
              ],
            ), 
            separatorBuilder: (context, index) => SizedBox(height: 10.h), 
          ),
        ],
      ),
    ), 
                    separatorBuilder: (context, index) => SizedBox(height: 5.h),
                  );
                }

                else
                {
                  return Center(child: CustomCircularIndicator());
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}