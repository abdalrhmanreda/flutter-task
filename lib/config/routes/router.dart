import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/config/routes/routes_path.dart';
import 'package:flutter_task/core/di/dependancy_injection.dart';
import 'package:flutter_task/features/filter/logic/cubit/filter_cubit.dart';
import 'package:flutter_task/features/filter/ui/screens/filter_screen.dart';
import 'package:flutter_task/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_task/features/home/ui/screens/home_screen.dart';
import 'package:flutter_task/features/layout/logic/cubit/layout_cubit.dart';
import 'package:flutter_task/features/layout/ui/screens/layout.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this argument is used to pass data from one screen to another
    // final arguments = settings.arguments;
    switch (settings.name) {
      case RoutePath.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutePath.layout:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LayoutCubit>(),
            child: const LayoutScreen(),
          ),
        );
      case RoutePath.filter:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<FilterCubit>(),
            child: const FilterScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
