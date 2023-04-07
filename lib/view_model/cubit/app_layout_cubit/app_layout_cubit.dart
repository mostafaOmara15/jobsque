import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view/screens/app_layout/home_screen/home_screen.dart';
import 'app_layout_states.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates>{
  AppLayoutCubit(): super(LayoutInitialState());

  static AppLayoutCubit get(context) => BlocProvider.of(context);

  static  List<Widget> appScreens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    emit(ChangeLayoutState());
  }

}