import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart'; 
part 'drugs_state.dart';

class DrugsCubit extends Cubit<DrugsState> 
{
  DrugsCubit() : super(DrugsInitial());
  
}
