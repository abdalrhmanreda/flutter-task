import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/config/routes/router.dart';
import 'package:flutter_task/flutter_task_app.dart';
import 'package:flutter_task/services.dart';

void main() async {
  await Services.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/lang',
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('en'),
      child: FlutterTaskApp(router: AppRouter()),
    ),
  );
}
