import 'package:card_oil/features/transaction_history/data/models/transaction_history_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/transaction_list_model.dart';

abstract class TransactionHistoryRepository {
  Future<Either<Failure, TransactionListModel>> getTransactionHistory(
      {required String typeTransaction});
}
