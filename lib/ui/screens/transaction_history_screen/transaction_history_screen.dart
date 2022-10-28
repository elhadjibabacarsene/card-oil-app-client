import 'package:card_oil/ui/screens/transaction_history_screen/components/transaction_history_body_screen/transaction_history_body_screen.dart';
import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique transactions'),
      ),
      body: const TransactionHistoryBodyScreen(),
    );
  }
}
