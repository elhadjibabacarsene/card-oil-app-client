import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/features/transaction_history/data/datasources/transaction_history_data_source_impl.dart';
import 'package:card_oil/features/transaction_history/data/models/transaction_history_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/transaction_history_repository.dart';
import '../models/transaction_list_model.dart';

class TransactionHistoryRepositoryImpl implements TransactionHistoryRepository {
  final TransactionHistoryDataSourceImpl transactionHistoryDataSourceImpl;

  TransactionHistoryRepositoryImpl({required this.transactionHistoryDataSourceImpl});

  @override
  Future<Either<Failure, TransactionListModel>> getTransactionHistory(
      {required String typeTransaction}) async {
    try {
      final TransactionListModel transactionListModel =
          await transactionHistoryDataSourceImpl.getTransactionHistory(typeTransaction: typeTransaction);
      return Right(transactionListModel);
    } on ServerException catch (e) {
      return const Left(ServerFailure(errorMessage: 'Une erreur est survenue !'));
    }
  }
}
