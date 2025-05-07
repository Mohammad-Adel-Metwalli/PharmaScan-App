import 'package:flutter/material.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';
import 'package:pharmascan/widgets/custom_app_bar.dart';
import 'package:pharmascan/widgets/custom_drawer.dart';
import 'package:pharmascan/widgets/orders_history_container.dart';
import '../Models/orders_history_model.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  List<OrdersHistoryModel> historyOfOrders = [
    OrdersHistoryModel(
      orderId: '001',
      orderDate: '2025-04-25',
      orderStatus: true,
      orderBill: 150,
    ),
    OrdersHistoryModel(
      orderId: '002',
      orderDate: '2025-04-24',
      orderStatus: false,
      orderBill: 200,
    ),
    OrdersHistoryModel(
      orderId: '003',
      orderDate: '2025-04-23',
      orderStatus: true,
      orderBill: 90,
    ),
    OrdersHistoryModel(
      orderId: '004',
      orderDate: '2025-04-22',
      orderStatus: true,
      orderBill: 300,
    ),
    OrdersHistoryModel(
      orderId: '005',
      orderDate: '2025-04-21',
      orderStatus: false,
      orderBill: 250,
    ),
  ];

  @override
  Widget build(BuildContext context)
  {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Form(
          key: formKey,

          child: Builder(
            builder:
                (context) => Column(
                  children: [
                    CustomAppBar(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.history, color: AppColors.customBoldGrey, size: 25),
                          Text(
                            ' Orders History',
                            style: AppStyles.pharmaScan16BoldCustomBoldGrey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: historyOfOrders.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: OrdersHistoryContainer(
                              historyModel: historyOfOrders[index],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.local_hospital,
                            color: AppColors.blue,
                            size: 25,
                          ),
                          Text(
                            ' Available Drugs',
                            style: AppStyles.pharmaScan16BoldCustomBoldGrey,
                          ),
                          Spacer(),

                          Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(110),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'View All',
                                    style: AppStyles.pharmaScan11BoldWhite,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search on drug...',
                          hintStyle: AppStyles.pharmaScan14Weight400CustomBoldGrey70,
                          prefixIcon: Icon(Icons.search, color: AppColors.blue),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: AppColors.blue,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: AppColors.blue,
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 10,
                          ),
                        ),
                        style: AppStyles.pharmaScan16Blue,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a search term';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
