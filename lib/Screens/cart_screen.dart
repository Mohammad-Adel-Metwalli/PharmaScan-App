import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pharmascan/Cubits/Cart-Cubit/cubit/cart_cubit.dart';
import 'package:pharmascan/Helpers/firebase_helper.dart';
import 'package:pharmascan/Models/cart_model.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_styles.dart';
import 'package:pharmascan/widgets/custom_button.dart';
import 'package:pharmascan/widgets/custom_cart_item.dart';
import 'package:pharmascan/widgets/custom_cherry_success_toast.dart';
import 'package:pharmascan/widgets/custom_circular_indicator.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String searchedDrug = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              children: [
                SizedBox(height: 20.h),

                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.blue,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.chevron_left_rounded,
                          color: AppColors.white,
                          size: 30.h,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Icon(
                      MingCute.shopping_bag_1_fill,
                      color: AppColors.blue,
                      size: 30.h,
                    ),

                    SizedBox(width: 5.w),

                    Text(
                      'My Cart',
                      style: GoogleFonts.poppins(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.customBoldGrey,
                      ),
                    ),

                    const Spacer(),

                    IconButton(
                      onPressed:
                          () => BlocProvider.of<CartCubit>(context).clearCart(),
                      icon: Icon(
                        Iconsax.trash_bold,
                        color: AppColors.red,
                        size: 30.h,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                TextFormField(
                  style: AppStyles.pharmaScan15Weight500Black,
                  onChanged: (data) => setState(() => searchedDrug = data),
                  decoration: InputDecoration(
                    hintText: 'Search on Drug...',
                    hintStyle: AppStyles.pharmaScan14Weight600CustomBoldGrey70,
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: AppColors.blue,
                      size: 30.h,
                    ),
                    border: AppStyles.borderStyleOfSearchBar(),
                    enabledBorder: AppStyles.borderStyleOfSearchBar(),
                    focusedBorder: AppStyles.borderStyleOfSearchBar(),
                  ),
                ),

                SizedBox(height: 10.h),

                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return Center(child: CustomCircularIndicator());
                    } else if (state is CartSuccess) {
                      List<CartModel> myCart =
                          BlocProvider.of<CartCubit>(context).cart;
                      List<CartModel> filteredCart =
                          myCart
                              .where(
                                (cartItem) => cartItem.name
                                    .toLowerCase()
                                    .contains(searchedDrug.toLowerCase()),
                              )
                              .toList();

                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: filteredCart.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder:
                            (context, index) => CustomCartItem(
                              cartModel: filteredCart[index],
                              index: index,
                            ),
                        separatorBuilder:
                            (context, index) => SizedBox(height: 10.h),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.sizeOf(context).height * 0.4,
                        ),
                        child: Row(
                          spacing: 5.w,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              MingCute.shopping_bag_1_fill,
                              color: AppColors.grey,
                              size: 40.h,
                            ),

                            Text(
                              'Empty Cart',
                              style: GoogleFonts.poppins(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),

            FutureBuilder<int>(
              future: FirebaseHelper.allOrders(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int orderNumber = snapshot.data!.toInt() + 1;
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 15.w,
                        left: 15.w,
                        bottom: 15.h,
                      ),
                      child: CustomButton(
                        borderRadiusValue: 50,
                        onPressed: () async {
                          List<CartModel> myCart =
                              BlocProvider.of<CartCubit>(context).cart;
                          if (myCart.isNotEmpty &&
                              myCart.any((item) => item.quantity > 0)) {
                            double totalPrice = myCart.fold(
                              0,
                              (sum, item) => sum + (item.price * item.quantity),
                            );
                            await FirebaseHelper.placeOrder(
                              myCart: myCart,
                              totalPrice: totalPrice,
                              userModel: widget.userModel,
                              orderNumber: orderNumber,
                            );
                            if (context.mounted) {
                              customCherrySuccessToast(
                                successTitle: 'Order Placed Successfully!',
                                successMessage: 'Check Your History',
                              ).show(context);
                              BlocProvider.of<CartCubit>(context).clearCart();
                            }
                          } else {
                            customCherrySuccessToast(
                              successTitle: 'Empty Cart',
                              successMessage: 'Please Add Drugs To Cart',
                              isFaild: true,
                            ).show(context);
                          }
                        },
                        buttonColor: AppColors.blue,
                        buttonBody: Row(
                          children: [
                            Icon(
                              Icons.delivery_dining_rounded,
                              color: AppColors.white,
                              size: 30.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Checkout',
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                            const Spacer(),
                            BlocBuilder<CartCubit, CartState>(
                              builder: (context, state) {
                                List<CartModel> myCart =
                                    BlocProvider.of<CartCubit>(context).cart;
                                double totalPrice = myCart.fold(
                                  0,
                                  (sum, item) =>
                                      sum + (item.price * item.quantity),
                                );
                                return Text(
                                  '${totalPrice.toStringAsFixed(2)} EGP',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 10.w),
                            CircleAvatar(
                              backgroundColor: AppColors.white,
                              radius: 15.h,
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: AppColors.blue,
                                size: 25.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(child: CustomCircularIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
