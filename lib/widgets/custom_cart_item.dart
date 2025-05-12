import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pharmascan/Cubits/Cart-Cubit/cubit/cart_cubit.dart';
import 'package:pharmascan/Models/cart_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/widgets/custom_button.dart';

class CustomCartItem extends StatefulWidget 
{
  const CustomCartItem({super.key, required this.cartModel, required this.index,}); 
  final CartModel cartModel;
  final int index;

  @override
  State<CustomCartItem> createState() => _CustomCartItemState();
}

class _CustomCartItemState extends State<CustomCartItem> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Container(
      width: double.infinity, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.blue, width: 3),
      ),
    
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 5.w),
              
              Image.asset('assets/Panadol.png', scale: 1.3, height: 100.h, width: 100.w), 
              
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  SizedBox(height: 5.h),
              
                  Text(
                    widget.cartModel.name,
                    style: GoogleFonts.poppins(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
              
                  SizedBox(height: 5.h),
              
                  Text(
                    '${widget.cartModel.price} EGP',
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
          
                  Row( 
                    children: [
                      IconButton( 
                        onPressed: () => widget.cartModel.quantity == 0 ? null : BlocProvider.of<CartCubit>(context).updateCart(cartModel: widget.cartModel, index: widget.index, isIncrement: false), 
                        icon: Icon(CupertinoIcons.minus_circle_fill, color: AppColors.red, size: 30.h),
                      ),
                  
                      Text(
                        widget.cartModel.quantity.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                  
                      IconButton( 
                        onPressed: () => BlocProvider.of<CartCubit>(context).updateCart(cartModel: widget.cartModel, index: widget.index, isIncrement: true), 
                        icon: Icon(CupertinoIcons.add_circled_solid, color: AppColors.green, size: 30.h),
                      ),
                    ], 
                  ),
                ],
              ), 
            ],
          ),

          SizedBox(height: 5.h),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              onPressed: () => BlocProvider.of<CartCubit>(context).removeFromCart(cartModel: widget.cartModel),
              buttonColor: AppColors.red, 
              buttonBody: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Icon(Iconsax.trash_bold, color: AppColors.white, size: 30.h),
                  SizedBox(width: 5.w),
                  Text(
                    'Remove',
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 