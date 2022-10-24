import 'package:card_oil/ui/screens/home_page_screen/home_page_screen.dart';
import 'package:card_oil/ui/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

import '../ui/screens/payment_services_screen/payment_services_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/login_screen':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePageScreen());
      case '/payment_services_screen':
        return MaterialPageRoute(builder: (_) => const PaymentServicesScreen());
    }
    return null;
  }
}
