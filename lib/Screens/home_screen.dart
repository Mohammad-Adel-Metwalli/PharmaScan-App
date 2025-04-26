import 'package:flutter/material.dart';
import 'package:pharmascan/models/history_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_text_styles.dart';
import 'package:pharmascan/widgets/custom_app_bar.dart';
import 'package:pharmascan/widgets/custom_drawer.dart';
import 'package:pharmascan/widgets/history_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HistoryModel> history = [
    HistoryModel(
      orderId: '001',
      orderDate: '2025-04-25',
      orderStatus: true,
      orderBill: '150',
    ),
    HistoryModel(
      orderId: '002',
      orderDate: '2025-04-24',
      orderStatus: false,
      orderBill: '200',
    ),
    HistoryModel(
      orderId: '003',
      orderDate: '2025-04-23',
      orderStatus: true,
      orderBill: '90',
    ),
    HistoryModel(
      orderId: '004',
      orderDate: '2025-04-22',
      orderStatus: true,
      orderBill: '300',
    ),
    HistoryModel(
      orderId: '005',
      orderDate: '2025-04-21',
      orderStatus: false,
      orderBill: '250',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Form(
          key: _formKey,

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
                          Icon(Icons.history, color: AppColors.gray, size: 25),
                          Text(
                            ' Orders History',
                            style: AppTextStyles.text.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: HistoryContainer(
                              historyModel: history[index],
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
                            style: AppTextStyles.text.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.gray,
                            ),
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
                                    style: AppTextStyles.text.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
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
                          hintStyle: AppTextStyles.text.copyWith(
                            fontSize: 14,
                            color: AppColors.gray.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                          ),
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
                        style: AppTextStyles.text.copyWith(
                          fontSize: 16,
                          color: AppColors.blue,
                        ),
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
