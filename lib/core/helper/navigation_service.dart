import 'package:flutter/material.dart';

final class NavigationService {
  NavigationService._internal();

  static final NavigationService _instance = NavigationService._internal();

  static NavigationService get instance => _instance;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<void> navigateTo(String routeName) async {
    final navigator = navigatorKey.currentState;
    if (navigator != null) {
      await navigator.pushNamed(routeName);
    }
  }

  // Replace the current route with a new one
  static Future<void> popAndReplace(String routeName) async {
    final navigator = navigatorKey.currentState;
    if (navigator != null) {
      await navigator.popAndPushNamed(routeName);
    }
  }

  // Navigate to a route and remove all previous routes
  static Future<void> navigateToUntilReplacement(String routeName) async {
    final navigator = navigatorKey.currentState;
    if (navigator != null) {
      await navigator.pushNamedAndRemoveUntil(routeName, (route) => false);
    }
  }

  // Navigate with arguments
  static Future<void> navigateToWithArgs(
    String routeName,
    Map<String, dynamic>? arguments,
  ) async {
    final navigator = navigatorKey.currentState;
    if (navigator != null) {
      await navigator.pushNamed(routeName, arguments: arguments);
    }
  }
}
