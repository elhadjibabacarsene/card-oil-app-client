import 'package:card_oil/constants/size/size.dart';
import 'package:card_oil/data/mocks/transaction_history_mocks/transaction_history_mocks.dart';
import 'package:flutter/material.dart';

import '../transaction_history_filter/transaction_history_filter.dart';
import '../transaction_history_list/transaction_history_list.dart';

class TransactionHistoryBodyScreen extends StatelessWidget {
  const TransactionHistoryBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPaddingHScreen(context),
      child: Column(
        children: [
          const TransactionHistoryFilter(),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: TransactionHistoryList(
              transactionHistoryMocks: transactionHistoryMocks,
            ),
          ),
        ],
      ),
    );
  }
}
