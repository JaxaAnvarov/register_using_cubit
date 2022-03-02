import 'package:flutter/material.dart';
import 'package:register_using_cubit/screens/auth/auth_bloc_view.dart';
import 'package:register_using_cubit/screens/home/home_page.dart';

class AppRouter {
  static generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => AuthBlocView(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
