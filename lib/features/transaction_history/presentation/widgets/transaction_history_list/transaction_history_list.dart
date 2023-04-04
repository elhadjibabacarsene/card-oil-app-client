import 'package:card_oil/features/transaction_history/presentation/bloc/transaction_history_bloc/transaction_history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/details_transaction_screen/details_transaction_screen.dart';
import '../transaction_history_item/transaction_item_history_item.dart';

class TransactionHistoryList extends StatelessWidget {
  const TransactionHistoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionHistoryBloc, TransactionHistoryState>(
        builder: (context, state) {
      return state is TransactionHistoryLoaded
          ? state.transactions.isEmpty
              ? const Center(
                  child: Text('Aucunes transactions'),
                )
              : Column(
                  children: List.generate(
                  state.transactions.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsTransaction(
                            transaction: state.transactions[index],
                          ),
                        ),
                      );
                    },
                    child: TransactionItemHistory(
                      transaction: state.transactions[index],
                    ),
                  ),
                ))
          : state is TransactionHistoryFailure
              ? Center(
                  child: Text(state.message),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
    });
  }
}
