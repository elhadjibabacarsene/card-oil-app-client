import 'package:card_oil/constants/size/size.dart';
import 'package:flutter/material.dart';

import '../transaction_history_filter/transaction_history_filter.dart';
import '../transaction_history_list/transaction_history_list.dart';

class TransactionHistoryBodyScreen extends StatelessWidget {
  const TransactionHistoryBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPaddingHScreen(context),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            TransactionHistoryFilter(),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: TransactionHistoryList(),
            ),
          ],
        ),
      ),
    );
  }
}
