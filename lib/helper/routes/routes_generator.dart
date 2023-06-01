
import 'package:api_ui_test_project/helper/routes/routes.dart';
import 'package:api_ui_test_project/login_module/login_screen.dart';
import 'package:api_ui_test_project/login_module/verification_screen.dart';
import 'package:api_ui_test_project/login_module/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RoutesGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget widgetScreen;
    final args = settings.arguments;
    switch (settings.name) {
      // case Routes.home:
      //   widgetScreen = HomeScreen();
      //   break;
      // case Routes.news:
      //   widgetScreen = NewsScreen();
      //   break;
      case Routes.login:
        widgetScreen = LoginScreen();
        break;
      case Routes.verification:
        widgetScreen = VerificationScreen();
        break;case Routes.welcome:
        widgetScreen = WelcomeScreen();
        break;
      default:
        widgetScreen = _errorRoute();
    }
    return GetPageRoute(
        routeName: settings.name, page: () => widgetScreen, settings: settings);
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('No Such screen found in route generator'),
      ),
    );
  }
}