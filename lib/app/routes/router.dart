import 'package:flutter/material.dart';
import 'package:store_nxt/app/routes/routes.dart';
import 'package:store_nxt/ui/screens/home_screen.dart';
import 'package:store_nxt/ui/screens/login_screen.dart';
import 'package:store_nxt/ui/screens/tutorial_screen.dart';

class AppRouter {
  PageRoute onGenerateMainRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.tutorial:
        return MaterialPageRoute(
            builder: (_) => TutorialScreen(), settings: settings);
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(), settings: settings);
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(), settings: settings);
    }
  }
}
