import 'dart:async';

import 'package:flutter_task/features/home/logic/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio dio = await DioFactory.initDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
