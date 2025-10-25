import 'package:easy_localization/easy_localization.dart' as easy_localization;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/routes/routes_path.dart';
import 'package:flutter_task/config/themes/themes.dart';
import 'package:flutter_task/config/routes/router.dart';

class FlutterTaskApp extends StatelessWidget {
  const FlutterTaskApp({super.key, required this.router});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          themeMode: ThemeMode.light,
          onGenerateRoute: router.generateRoute,
          initialRoute: RoutePath.home,
          theme: Style.lightTheme,
          debugShowCheckedModeBanner: false,
          darkTheme: Style.darkTheme,
        ),
      ),
    );
  }
}
