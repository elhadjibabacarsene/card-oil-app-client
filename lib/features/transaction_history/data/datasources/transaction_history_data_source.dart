import 'package:card_oil/features/transaction_history/data/models/transaction_list_model.dart';


abstract class TransactionHistoryDataSource {
  Future<TransactionListModel> getTransactionHistory(
      {required String typeTransaction});
}
