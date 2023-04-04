import '../models/transaction_history_model.dart';

abstract class TransactionHistoryDataSource {
  Future<TransactionHistory> getTransactionHistory(
      {required String idUser, required String walletType});
}
