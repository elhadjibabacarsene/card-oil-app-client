import 'package:card_oil/ui/profile_screen/profile_screen.dart';
import 'package:card_oil/ui/screens/home_page_screen/home_page_screen.dart';
import 'package:card_oil/ui/screens/login_screen/login_screen.dart';
import 'package:card_oil/ui/screens/loyalty_point/loyalty_point_screen.dart';
import 'package:card_oil/ui/screens/nfc_screen/nfc_screen.dart';
import 'package:card_oil/ui/screens/qr_code_screen/qr_code_screen.dart';
import 'package:card_oil/ui/screens/transaction_history_screen/transaction_history_screen.dart';
import 'package:flutter/material.dart';

import '../ui/screens/payment_services_screen/payment_services_screen.dart';
import '../ui/screens/success_screen/success_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/login_screen':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePageScreen());
      case '/payment_services_screen':
        return MaterialPageRoute(builder: (_) => const PaymentServicesScreen());
      case '/qr_code_screen':
        return MaterialPageRoute(builder: (_) => const QrCodeScreen());
      case '/nfc_screen':
        return MaterialPageRoute(builder: (_) => const NfcScreen());
      case '/transaction_history_screen':
        return MaterialPageRoute(
            builder: (_) => const TransactionHistoryScreen(),);
      case '/loyalty_point_screen':
        return MaterialPageRoute(builder: (_) => const LoyaltyPointScreen());
      case '/success_screen':
        return MaterialPageRoute(builder: (_) => const SuccessScreen());
      case '/profile_screen':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
    }
    return null;
  }
}
