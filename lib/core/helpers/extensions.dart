import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../animation/animation_navigate.dart';

extension Navigation on BuildContext {
  // ----------------- Widget -----------------
  Future<dynamic> navigateToWidget(context, widget) {
    final platform = Theme.of(this).platform;
    if (platform == TargetPlatform.iOS) {
      return Navigator.push(
        this,
        CupertinoPageRoute(builder: (_) => widget),
      );
    } else {
      return Navigator.push(
        this,
        ScaleTransition1(widget),
      );
    }
  }

  // ----------------- Named Routes -----------------
  Future<dynamic> navigateToWidgetByNamed(context, String routeName,
          {Object? arguments}) =>
      Navigator.pushNamed(context, routeName, arguments: arguments);

  // ----------------- Named Routes and Finish -----------------
  Future<dynamic> navigateAndFinishNyNamed(context, String routeName,
          {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        (Route<dynamic> route) => false,
        arguments: arguments,
      );

  // ----------------- Named Routes and Finish -----------------
  Future<dynamic> navigateAndFinish(context, Widget widget) {
    final platform = Theme.of(this).platform;
    if (platform == TargetPlatform.iOS) {
      return Navigator.pushAndRemoveUntil(
        this,
        CupertinoPageRoute(builder: (_) => widget),
        (Route<dynamic> route) => false,
      );
    } else {
      return Navigator.pushAndRemoveUntil(
        this,
        ScaleTransition1(widget),
        (Route<dynamic> route) => false,
      );
    }
  }

  // ----------------- replace -----------------
  Future<dynamic> navigateAndReplacement(context, String routeName,
          {Object? arguments}) =>
      Navigator.pushReplacementNamed(
        context,
        routeName,
        arguments: arguments,
      );

  // ----------------- Named Routes and Finish -----------------
  void pop(context) => Navigator.pop(context);
}
