import 'package:card_oil/features/transaction_history/data/models/transaction_model.dart';
import 'package:flutter/material.dart';

import 'components/details_transaction_body_screen.dart';

class DetailsTransaction extends StatelessWidget {
  const DetailsTransaction({Key? key, required this.transaction})
      : super(key: key);

  final TransactionModel transaction;

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
