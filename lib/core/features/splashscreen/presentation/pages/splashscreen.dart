import 'package:card_oil/core/features/get_details_user/presentation/bloc/get_details_user_bloc.dart';
import 'package:card_oil/core/helpers/loading_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../constants/colors/app_colors.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mentheSecondaryColor,
      body: BlocListener<GetDetailsUserBloc, GetDetailsUserState>(
        listener: (_, state) {
          if (state is GetDetailsUserLoaded) {
            /*
            BlocProvider.of<GetBalanceBloc>(context)
                .add(ToGetBalance(idUser: state.userDetails.idUser.toString()));*/
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/home_page',
              (route) => false,
            );
          } else if (state is GetDetailsUserError || state is UserUnAuthenticated) {
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
