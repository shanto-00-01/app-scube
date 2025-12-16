import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../scube/view/auth/login_screen.dart';

final class Routes {
  Routes._internal();
  static final Routes _instance = Routes._internal();
  static Routes get instance => _instance;

  static const String logIn = 'login_in';
}

final class RouteGenerator {
  RouteGenerator._internal();
  static final RouteGenerator _instance = RouteGenerator._internal();
  static RouteGenerator get instance => _instance;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.logIn:
        return CupertinoPageRoute(builder: (_) => LoginScreen());

      default:
        return null;
    }
  }
}
