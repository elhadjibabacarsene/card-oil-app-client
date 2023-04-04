import 'package:card_oil/features/transaction_history/data/models/transaction_history_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class TransactionHistoryRepository {
  Future<Either<Failure, TransactionHistory>> getTransactionHistory(
      {required String idUser, required String walletType});
}
