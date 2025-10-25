import 'dart:async';

import 'package:flutter_task/features/filter/logic/cubit/filter_cubit.dart';
import 'package:flutter_task/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_task/features/layout/logic/cubit/layout_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio dio = await DioFactory.initDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerFactory<LayoutCubit>(() => LayoutCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<FilterCubit>(() => FilterCubit());
}
