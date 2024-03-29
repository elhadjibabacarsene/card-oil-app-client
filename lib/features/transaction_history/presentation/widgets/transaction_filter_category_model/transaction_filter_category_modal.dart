import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/core/bloc/user_details_bloc/user_details_bloc.dart';
import 'package:card_oil/core/features/get_details_user/presentation/bloc/get_details_user_bloc.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/check_option/check_option.dart';
import '../../../../../single_app.dart';
import '../../bloc/transaction_history_bloc/transaction_history_bloc.dart';

class TransactionFilterCategoryModal extends StatelessWidget {
  const TransactionFilterCategoryModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getTransaction(GetDetailsUserLoaded state, String typeTransaction) {
      BlocProvider.of<TransactionHistoryBloc>(context).add(
        GetTransactionHistory(
          typeTransaction: typeTransaction,
        ),
      );
    }

    return BlocBuilder<GetDetailsUserBloc, GetDetailsUserState>(
        builder: (context, state) {
      return state is GetDetailsUserLoaded
          ? SizedBox(
              height: 250,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: CustomText(
                      text: 'Type transactions',
                      fontSize: 20,
                      customTextFontWeight: CustomTextFontWeight.bold,
                      color: blueDarkPrimaryColor,
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CheckOption(
                          title: 'Mes Achats',
                          status: true,
                          onTap: () {
                            getTransaction(state, 'achat');
                            Navigator.pop(context);
                          },
                        ),
                        CheckOption(
                          title: 'Mes recharges',
                          status: false,
                          onTap: () {
                            getTransaction(state, 'recharge');
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Container();
    });
  }
}
