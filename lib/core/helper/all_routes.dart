import 'package:app_scube/scube/view/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../scube/view/auth/login_screen.dart';
import '../../scube/view/show/show_screen.dart';

final class Routes {
  Routes._internal();
  static final Routes _instance = Routes._internal();
  static Routes get instance => _instance;

  static const String logIn = 'login_in';
  static const String dashboardScreen = 'dashboard_screen';
  static const String sCMDetailScreen = 'sCM_detail_screen';
}

final class RouteGenerator {
  RouteGenerator._internal();
  static final RouteGenerator _instance = RouteGenerator._internal();
  static RouteGenerator get instance => _instance;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.logIn:
        return CupertinoPageRoute(builder: (_) => LoginScreen());

      case Routes.dashboardScreen:
        return CupertinoPageRoute(builder: (_) => DashboardScreen());

      case Routes.sCMDetailScreen:
        return CupertinoPageRoute(builder: (_) => SCMDetailScreen());

      default:
        return null;
    }
  }
}
