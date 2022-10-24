import 'package:card_oil/ui/screens/home_page_screen/components/home_page_screen_app_bar/home_page_screen_app_bar.dart';
import 'package:card_oil/ui/screens/home_page_screen/components/home_page_screen_body.dart';
import 'package:flutter/material.dart';

import '../../../constants/size/size.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: SafeArea(child: HomePageScreenAppBar())),
      body: Padding(
        padding: getPaddingHScreen(context),
        child: const HomePageScreenBody(),
      ),
    );
  }
}
