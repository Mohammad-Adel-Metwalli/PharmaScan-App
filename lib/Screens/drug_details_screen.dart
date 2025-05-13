import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmascan/Cubits/Cart-Cubit/cubit/cart_cubit.dart';
import 'package:pharmascan/Models/cart_model.dart';
import 'package:pharmascan/Models/drug_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmascan/widgets/custom_cherry_success_toast.dart';

class DrugDetailsScreen extends StatefulWidget {
  const DrugDetailsScreen({super.key, required this.drugModel});
  final DrugModel drugModel;

  @override
  State<DrugDetailsScreen> createState() => _DrugDetailsScreenState();
}

class _DrugDetailsScreenState extends State<DrugDetailsScreen> {
  CartModel? cartModel;
  int neededDrugQuantity = 0;

  @override
  void initState() {
    super.initState();
    cartModel = CartModel(
      name: widget.drugModel.name,
      price: widget.drugModel.price,
      quantity: neededDrugQuantity,
      barCode: widget.drugModel.barCode,
    );
    cartModel!.quantity++;
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: AppColors.white,
                      size: 30.h,
                    ),
                  ),
                ),

                const Spacer(),

                Image.asset('assets/Group 21.png', scale: (0.8).h),

                SizedBox(width: 5.w),

                Text(
                  'Drug Details',
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.customBoldGrey,
                  ),
                ),

                const Spacer(flex: 2),
              ],
            ),

            SizedBox(height: 20.h),

            Image.asset('assets/Panadol.png', scale: 0.5),

            SizedBox(height: 10.h),

            Center(
              child: Text(
                widget.drugModel.name,
                style: GoogleFonts.poppins(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.customBoldGrey,
                ),
              ),
            ),

            SizedBox(height: 10.h),

            Center(
              child: Text(
                '${widget.drugModel.price.toStringAsFixed(2)} EGP',
                style: GoogleFonts.poppins(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blue,
                ),
              ),
            ),

            SizedBox(height: 10.h),

            Center(
              child: BarcodeWidget(
                data: widget.drugModel.barCode,
                barcode: Barcode.code128(),
                width: 200.w,
                height: 80.h,
                color: AppColors.black,
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              widget.drugModel.description,
              style: GoogleFonts.poppins(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.customBoldGrey,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20.h),

            Center(
              child: Container(
                height: 40.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(100),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed:
                          () => setState(
                            () =>
                                cartModel!.quantity == 0
                                    ? null
                                    : --cartModel!.quantity,
                          ),
                      icon: Icon(
                        CupertinoIcons.minus_circle_fill,
                        color: AppColors.white,
                        size: 25.h,
                      ),
                    ),

                    Text(
                      cartModel!.quantity.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),

                    IconButton(
                      onPressed: () => setState(() => ++cartModel!.quantity),
                      icon: Icon(
                        CupertinoIcons.add_circled_solid,
                        color: AppColors.white,
                        size: 25.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h),

            BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartSuccess) {
                  Navigator.pop(context);
                }
              },

              builder: (context, state) {
                return CustomButton(
                  onPressed: () {
                    cartModel!.quantity == 0
                        ? null
                        : BlocProvider.of<CartCubit>(
                          context,
                        ).addToCart(cartModel: cartModel!);

                    customCherrySuccessToast(
                      successTitle: 'Drug Added',
                      successMessage: 'successfully Added To Cart',
                    ).show(context);
                  },

                  buttonColor: AppColors.blue,
                  buttonBody: Row(
                    children: [
                      Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Center(
                          child: Text(
                            '${(cartModel!.quantity * widget.drugModel.price).toStringAsFixed(2)} EGP',
                            style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10.w),

                      Text(
                        'Add To Cart',
                        style: GoogleFonts.poppins(
                          fontSize: 23.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
