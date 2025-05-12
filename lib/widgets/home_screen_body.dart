import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmascan/Helpers/firebase_helper.dart';
import 'package:pharmascan/Models/drug_model.dart';
import 'package:pharmascan/Models/orders_history_model.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/Screens/drug_details_screen.dart';
import 'package:pharmascan/Screens/drugs_screen.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';
import 'package:pharmascan/widgets/custom_app_bar.dart';
import 'package:pharmascan/widgets/custom_button.dart';
import 'package:pharmascan/widgets/custom_circular_indicator.dart';
import 'package:pharmascan/widgets/custom_drug_item.dart';
import 'package:pharmascan/widgets/orders_history_item.dart';

class HomeScreenBody extends StatefulWidget
{
  const HomeScreenBody({super.key, required this.userModel,}); 
  final UserModel userModel;

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> 
{
  List<OrdersHistoryModel> history = [];
  String searchedDrug = '';

  @override
  Widget build(BuildContext context) 
  {
    return ListView(
      children: [ 
        SizedBox(height: 10.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: CustomAppBar(userModel: widget.userModel),
        ),
    
        SizedBox(height: 20.h),
    
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            spacing: 5.w,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.history, color: AppColors.customBoldGrey, size: 30.h),
              Text('Orders History', style: AppStyles.pharmaScan19BoldCustomBoldGrey),
            ],
          ),
        ),

        SizedBox(height: 10.h),

        StreamBuilder(
          stream: FirebaseHelper.fetchAllOrders(),
          builder: (context, snapshot) 
          {
            if(snapshot.hasData)
            {
              List<QueryDocumentSnapshot<Map<String, dynamic>>> ordersCollection = snapshot.data!.docs.toList(); 
              List<OrdersHistoryModel> allOrders = ordersCollection.map((doc) => OrdersHistoryModel.fromFirestore(doc.data())).toList(); 

              return SizedBox(
                height: 85.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allOrders.length,
                  itemBuilder: (context, index) => allOrders[index].email == widget.userModel.email ? Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 10.w : 7.w, right: index == allOrders.length - 1 ? 10.w : 7.w),
                    child: OrdersHistoryItem(historyModel: allOrders[index]),
                  ) : const SizedBox.shrink(),
                ),
              );
            }

            else
            {
              return Center(child: CustomCircularIndicator());
            }
          }
        ),

        SizedBox(height: 20.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              Image.asset('assets/Group 21.png', scale: 0.8),

              SizedBox(width: 5.w),

              Text('Available Drugs', style: AppStyles.pharmaScan19BoldCustomBoldGrey),

              const Spacer(),

              CustomButton(
                height: 35,
                width: 70,
                borderRadiusValue: 50,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DrugsScreen(userModel: widget.userModel))),
                buttonColor: AppColors.blue, 
                buttonBody: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('View All', style: AppStyles.pharmaScan13BoldWhite),

                    Icon(Icons.chevron_right_rounded, color: AppColors.white, size: 25.h),
                  ],
                ),
              ),

              SizedBox(width: 10.w),
            ],
          ),
        ),

        SizedBox(height: 5.h),
        
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: TextFormField( 
            style: AppStyles.pharmaScan15Weight500Black, 
            onChanged: (data) => setState(() => searchedDrug = data),
            decoration: InputDecoration(
              hintText: 'Search on Drug...',
              hintStyle: AppStyles.pharmaScan14Weight600CustomBoldGrey70,
              prefixIcon: Icon(CupertinoIcons.search, color: AppColors.blue, size: 30.h),
              border: AppStyles.borderStyleOfSearchBar(),
              enabledBorder: AppStyles.borderStyleOfSearchBar(),
              focusedBorder: AppStyles.borderStyleOfSearchBar(),
            ),
          ),
        ), 

        StreamBuilder(
          stream: FirebaseHelper.fetchAllDrugs(),
          builder: (context, snapshot) 
          {
            if(snapshot.hasData)
            { 
              List<QueryDocumentSnapshot<Map<String, dynamic>>> drugsCollection = snapshot.data!.docs.toList(); 
              List<DrugModel> allDrugs = drugsCollection.map((doc) => DrugModel.fromFirestore(doc.data())).toList(); 
              List<DrugModel> filteredDrugs = searchedDrug.isEmpty ? allDrugs : allDrugs.where((drugItem) { 
                final drug = drugItem.name.toLowerCase(); 
                return drug.contains(searchedDrug.toLowerCase());
              }).toList(); 

              return ListView.builder(
              shrinkWrap: true,
              itemCount: filteredDrugs.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  child: CustomDrugItem(
                    drugModel: filteredDrugs[index],
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DrugDetailsScreen(drugModel: filteredDrugs[index]))),
                  ),
                );
              },
            );
            }

            else
            { 
              return Center(child: CustomCircularIndicator());
            }
          }
        ),
      ],
    );
  }
}