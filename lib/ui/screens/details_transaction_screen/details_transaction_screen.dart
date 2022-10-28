import 'package:card_oil/data/models/transaction_model/transaction_model.dart';
import 'package:flutter/material.dart';

import '../../../data/models/transaction_history_item_model/transaction_history_model.dart';
import 'components/details_transaction_body_screen.dart';

class DetailsTransaction extends StatelessWidget {
  const DetailsTransaction({Key? key, required this.transaction})
      : super(key: key);

  final TransactionHistoryModel transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails transaction'),
      ),
      body: DetailsTransactionBodyScreen(
        transaction: transaction,
      ),
    );
  }
}
