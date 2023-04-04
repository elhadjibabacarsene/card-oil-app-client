import 'package:card_oil/core/bloc/user_details_bloc/user_details_bloc.dart';
import 'package:card_oil/features/transaction_history/presentation/bloc/transaction_history_bloc/transaction_history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../single_app.dart';
import '../widgets/transaction_history_body_screen/transaction_history_body_screen.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        if(state is UserDetailsIsLoaded){
          BlocProvider.of<TransactionHistoryBloc>(context).add(
            GetTransactionHistory(
              idUser: state.userDetails.idUser.toString(),
              walletType: 'sender',
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Historique transactions'),
          ),
          body: const TransactionHistoryBodyScreen(),
        );
      }
    );
  }
}
