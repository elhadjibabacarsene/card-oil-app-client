import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/features/transaction_history/data/datasources/transaction_history_data_source_impl.dart';
import 'package:card_oil/features/transaction_history/data/models/transaction_history_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/transaction_history_repository.dart';

class TransactionHistoryRepositoryImpl implements TransactionHistoryRepository {
  final TransactionHistoryDataSourceImpl transactionHistoryDataSourceImpl;

  TransactionHistoryRepositoryImpl({required this.transactionHistoryDataSourceImpl});

  @override
  Future<Either<Failure, TransactionHistory>> getTransactionHistory(
      {required String idUser, required String walletType}) async {
    try {
      final TransactionHistory transactionHistory =
          await transactionHistoryDataSourceImpl.getTransactionHistory(
              idUser: idUser, walletType: walletType);
      return Right(transactionHistory);
    } on ServerException catch (e) {
      return const Left(ServerFailure(errorMessage: 'Une erreur est survenue !'));
    }
  }
}
