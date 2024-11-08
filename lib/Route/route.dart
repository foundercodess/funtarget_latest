
import 'package:flutter/material.dart';
import 'package:funtarget/Views/Auth/login_screen.dart';
import 'package:funtarget/Views/dashboard_screen.dart';

class AppRoutes {
  static const String loginScreen = '/';
  static const String dashboardScreen = '/home';

  static final Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginPageScreen(),
    dashboardScreen: (context) => DashboardPageScreen(),
  };
}