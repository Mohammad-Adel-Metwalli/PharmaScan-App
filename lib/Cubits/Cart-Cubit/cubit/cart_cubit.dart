import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:flutter/material.dart';
import 'package:pharmascan/Models/cart_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> 
{
  CartCubit() : super(CartInitial());
  List<CartModel> cart = [];

  void addToCart({required CartModel cartModel}) 
  { 
    emit(CartLoading());

    try
    {
      cart.add(cartModel); 
      emit(CartSuccess());
    }

    catch(e)
    {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  void removeFromCart({required CartModel cartModel}) 
  {
    emit(CartLoading());

    try
    {
      cart.remove(cartModel); 
      emit(CartSuccess());
    }

    catch(e)
    {
      emit(CartFailure(errorMessage: e.toString()));
    } 
  }

  void updateCart({required CartModel cartModel, required int index, required bool isIncrement}) 
  {
    emit(CartLoading());

    try
    {
      if(isIncrement)
      {
        cart[index].quantity++;
      }

      else
      {
        cart[index].quantity--;
      }

      emit(CartSuccess());
    }

    catch(e)
    {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  void clearCart() 
  {
    emit(CartLoading());

    try
    {
      cart.clear(); 
      emit(CartSuccess());
    }

    catch(e)
    {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }
}