import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:flutter/material.dart';

import '../../../../data/mocks/home_page_service_mocks/home_page_service_mocks.dart';
import 'balance_home_page/balance_home_page.dart';
import 'home_page_services/homE_page_services.dart';

class HomePageScreenBody extends StatelessWidget {
  const HomePageScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getH(context) * 0.035),
      child: Column(
        children: [
          const BalanceHomePage(),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: HomePageServices(homeServicesList: homePageServiceMocks),
          ),
        ],
      ),
    );
  }
}
