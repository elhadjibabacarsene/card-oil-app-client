import 'package:card_oil/core/bloc/user_details_bloc/user_details_bloc.dart';
import 'package:card_oil/core/features/get_details_user/presentation/bloc/get_details_user_bloc.dart';
import 'package:card_oil/features/home_page/presentation/widget/home_page_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/size/size.dart';
import '../bloc/get_balance_bloc/get_balance_bloc.dart';
import '../widget/home_page_screen_app_bar/home_page_screen_app_bar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child: SafeArea(
            child: HomePageScreenAppBar(),
          ),
        ),
        body: BlocBuilder<GetDetailsUserBloc, GetDetailsUserState>(
            builder: (context, state) {
          if (state is GetDetailsUserLoaded) {
            // TODO::GetBalance with api
            BlocProvider.of<GetBalanceBloc>(context).add(
              ToGetBalance(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: getPaddingHScreen(context),
              child: const HomePageScreenBody(),
            ),
          );
        }),
      ),
    );
  }
}
