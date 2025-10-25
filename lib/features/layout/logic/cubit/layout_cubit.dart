import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/di/dependancy_injection.dart';
import 'package:flutter_task/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_task/features/home/ui/screens/home_screen.dart';
import 'package:flutter_task/features/layout/logic/cubit/layout_state.dart';
import 'package:flutter_task/features/packages/ui/screens/packages_screen.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutStateInitial());
  List<Widget> screen = [
    BlocProvider(
      create: (context) => getIt<HomeCubit>()..getProducts(),
      child: HomeScreen(),
    ),
    Container(),
    Container(),
    Container(),
    PackagesPlanScreen(),
  ];
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarState(index: index));
  }
}
