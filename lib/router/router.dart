import 'package:card_oil/core/features/splashscreen/presentation/pages/splashscreen.dart';
import 'package:card_oil/features/check_account/presentation/pages/check_account_page.dart';
import 'package:card_oil/features/home_page/presentation/bloc/get_balance_bloc/get_balance_bloc.dart';
import 'package:card_oil/features/sign_in/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:card_oil/features/sign_up/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:card_oil/features/sign_up/presentation/pages/sign_up_page_step1.dart';
import 'package:card_oil/features/sign_up/presentation/pages/sign_up_page_step2.dart';
import 'package:card_oil/features/transaction_history/presentation/bloc/transaction_history_bloc/transaction_history_bloc.dart';
import 'package:card_oil/ui/profile_screen/profile_screen.dart';
import 'package:card_oil/ui/screens/login_screen/login_screen.dart';
import 'package:card_oil/ui/screens/loyalty_point/loyalty_point_screen.dart';
import 'package:card_oil/ui/screens/nfc_screen/nfc_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/check_account/presentation/pages/check_account_otp_page.dart';
import '../features/home_page/presentation/pages/home_page_screen.dart';
import '../features/qr_code_payment/presentation/pages/qr_code_screen.dart';
import '../features/transaction_history/presentation/pages/transaction_history_screen.dart';
import '../single_app.dart';
import '../ui/screens/payment_services_screen/payment_services_screen.dart';
import '../ui/screens/success_screen/success_screen.dart';

class AppRouter {
  final SignUpBloc signUpBloc = SignUpBloc();
  final GetBalanceBloc getBalanceBloc = GetBalanceBloc();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MultiBlocProvider(providers: [BlocProvider.value(value: getBalanceBloc,)], child: const Splashscreen()));
      case '/login_page':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SignInBloc()),
            ],
            child: const LoginScreen(),
          ),
        );
      case '/home_page':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(value: getBalanceBloc, child: const HomePageScreen()),
        );
      case '/check_account_page':
        return MaterialPageRoute(builder: (_) => const CheckAccountPage());
      case '/check_account_otp_page':
        return MaterialPageRoute(builder: (_) => const CheckAccountOtpPage());
      // return MaterialPageRoute(builder: (_) => const HomePageScreen());
      case '/payment_services_screen':
        return MaterialPageRoute(builder: (_) => const PaymentServicesScreen());
      case '/qr_code_screen':
        return MaterialPageRoute(builder: (_) => const QrCodeScreen());
      case '/nfc_screen':
        return MaterialPageRoute(builder: (_) => const NfcScreen());
      case '/transaction_history_screen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => TransactionHistoryBloc(),
            child: const TransactionHistoryScreen(),
          ),
        );
      case '/loyalty_point_screen':
        return MaterialPageRoute(builder: (_) => const LoyaltyPointScreen());
      case '/success_screen':
        return MaterialPageRoute(builder: (_) => const SuccessScreen());
      case '/profile_screen':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/sign_up_page_step_1':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: signUpBloc, child: const SignUpPageStep1()));
      case '/sign_up_page_step_2':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: signUpBloc, child: const SignUpPageStep2()));
    }
    return null;
  }
}
