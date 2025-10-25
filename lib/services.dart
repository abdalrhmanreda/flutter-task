import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/cache/cache_helper.dart';
import 'package:flutter_task/core/observer/bloc_observer.dart';
import 'package:flutter_task/core/di/dependancy_injection.dart';
import 'package:flutter_task/core/cache/sql_helper.dart';

class Services {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SqlHelper().database;
    // Dependency injection
    setupGetIt();

    // Shared preferences
    await SharedPrefService().init();
    // Localization
    await EasyLocalization.ensureInitialized();
    // Bloc observer
    Bloc.observer = MyBlocObserver();
  }
}
