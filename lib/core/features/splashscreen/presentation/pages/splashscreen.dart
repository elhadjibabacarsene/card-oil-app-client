import 'dart:math';
import 'dart:typed_data';

import 'package:card_oil/core/bloc/user_details_bloc/user_details_bloc.dart';
import 'package:card_oil/features/sign_in/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:card_oil/core/helpers/key_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../constants/colors/app_colors.dart';
import '../../../../../features/home_page/presentation/bloc/get_balance_bloc/get_balance_bloc.dart';
import '../../../../../single_app.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserDetailsBloc>(context).add(GetUserDetails());
    return Scaffold(
      backgroundColor: mentheSecondaryColor,
      body: BlocListener<UserDetailsBloc, UserDetailsState>(
        listener: (_, state) {
          if (state is UserDetailsIsLoaded) {
            BlocProvider.of<GetBalanceBloc>(context)
                .add(ToGetBalance(idUser: state.userDetails.idUser.toString()));
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/home_page',
                  (route) => false,
            );
          } else {
            //BlocProvider.of<UserDetailsBloc>(context).add(GetUserDetails());
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/login_page',
                  (route) => false,
            );
          }
        },
        child: Center(
          child: Lottie.asset('assets/lotties/drop-oil.json'),
        ),
      ),
    );
  }
}
