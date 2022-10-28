import 'package:card_oil/data/models/transaction_history_item_model/transaction_history_model.dart';
import 'package:card_oil/ui/screens/details_transaction_screen/details_transaction_screen.dart';
import 'package:card_oil/ui/screens/transaction_history_screen/components/transaction_history_item/transaction_item_history_item.dart';
import 'package:flutter/material.dart';

class TransactionHistoryList extends StatelessWidget {
  const TransactionHistoryList({
    Key? key,
    required this.transactionHistoryMocks,
  }) : super(key: key);

  final List<TransactionHistoryModel> transactionHistoryMocks;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      transactionHistoryMocks.length,
      (index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsTransaction(
                transaction: transactionHistoryMocks[index],
              ),
            ),
          );
        },
        child: TransactionItemHistory(
          transaction: transactionHistoryMocks[index],
        ),
      ),
    ));
  }
}
