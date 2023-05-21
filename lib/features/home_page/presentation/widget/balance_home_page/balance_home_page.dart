import 'package:card_oil/core/helpers/amount_helper.dart';
import 'package:card_oil/features/home_page/presentation/bloc/get_balance_bloc/get_balance_bloc.dart';
import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/colors/app_colors.dart';
import '../../../../../core/bloc/user_details_bloc/user_details_bloc.dart';
import '../../../../../core/features/get_details_user/presentation/bloc/get_details_user_bloc.dart';
import '../../../../../single_app.dart';

class BalanceHomePage extends StatelessWidget {
  const BalanceHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildRefreshBalance() {
      return GestureDetector(
          onTap: () {
            BlocProvider.of<GetBalanceBloc>(context).add(ToGetBalance());
          },
          child: const Icon(
            Icons.refresh,
            color: mentheSecondaryColor,
            size: 25,
          ));
    }


    return BlocBuilder<GetBalanceBloc, GetBalanceState>(
        builder: (context, state) {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset('assets/images/balance.png'),
              Padding(
                padding: EdgeInsets.only(bottom: getH(context) * 0.025),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: getH(context) * 0.007),
                      child: const CustomText(
                        text: 'Solde actuel',
                        fontSize: 16,
                        customTextFontWeight: CustomTextFontWeight.regular,
                        color: menthePrimaryColor,
                      ),
                    ),
                    state is GetBalanceFailure
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Une erreur est survenue',
                        ),
                        buildRefreshBalance(),
                      ],
                    )
                        : state is GetBalanceSuccess
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text:
                          '${sl<AmountHelper>().formatAmount(state.balance)} F',
                          fontSize: getW(context) * 0.065,
                          customTextFontWeight:
                          CustomTextFontWeight.extraBold,
                          color: mentheSecondaryColor,
                        ),
                        buildRefreshBalance(),
                      ],
                    )
                        : const CircularProgressIndicator(),
                  ],
                ),
              )
            ],
          );
        });

    return BlocBuilder<GetDetailsUserBloc, GetDetailsUserState>(
        builder: (context, state) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset('assets/images/balance.png'),
          Padding(
            padding: EdgeInsets.only(bottom: getH(context) * 0.025),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: getH(context) * 0.007),
                  child: const CustomText(
                    text: 'Solde actuel',
                    fontSize: 16,
                    customTextFontWeight: CustomTextFontWeight.regular,
                    color: menthePrimaryColor,
                  ),
                ),
                state is GetDetailsUserError
                    ?  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Une erreur est survenue',
                          ),
                          buildRefreshBalance(),
                        ],
                      )
                    : state is GetDetailsUserLoaded
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: state.user.wallet != null &&
                                        state.user.wallet?.balance != null
                                    ? '${sl<AmountHelper>().formatAmount(state.user.wallet!.balance!)} F'
                                    : 'NaN',
                                fontSize: getW(context) * 0.065,
                                customTextFontWeight:
                                    CustomTextFontWeight.extraBold,
                                color: mentheSecondaryColor,
                              ),
                              buildRefreshBalance(),
                            ],
                          )
                        : const CircularProgressIndicator(),
              ],
            ),
          )
        ],
      );
    });

    return BlocBuilder<GetBalanceBloc, GetBalanceState>(
        builder: (context, state) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset('assets/images/balance.png'),
          Padding(
            padding: EdgeInsets.only(bottom: getH(context) * 0.025),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: getH(context) * 0.007),
                  child: const CustomText(
                    text: 'Solde actuel',
                    fontSize: 16,
                    customTextFontWeight: CustomTextFontWeight.regular,
                    color: menthePrimaryColor,
                  ),
                ),
                state is GetBalanceFailure
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Une erreur est survenue',
                          ),
                          buildRefreshBalance(),
                        ],
                      )
                    : state is GetBalanceSuccess
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text:
                                    '${sl<AmountHelper>().formatAmount(state.balance)} F',
                                fontSize: getW(context) * 0.065,
                                customTextFontWeight:
                                    CustomTextFontWeight.extraBold,
                                color: mentheSecondaryColor,
                              ),
                              buildRefreshBalance(),
                            ],
                          )
                        : const CircularProgressIndicator(),
              ],
            ),
          )
        ],
      );
    });
  }
}
