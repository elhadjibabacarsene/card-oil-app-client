import 'package:card_oil/features/transaction_history/data/models/transaction_list_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../../../../single_app.dart';
import '../../data/repositories/transaction_history_repository_impl.dart';

class GetListTransaction
    implements UseCases<TransactionListModel, GetListTransactionParams> {
  @override
  Future<Either<Failure, TransactionListModel>> call(
      GetListTransactionParams getListTransactionParams) async {
    final TransactionHistoryRepositoryImpl transactionHistoryRepository =
        sl<TransactionHistoryRepositoryImpl>();
    return await transactionHistoryRepository.getTransactionHistory(
      typeTransaction: getListTransactionParams.typeTransaction,
    );
  }
}

class GetListTransactionParams extends Equatable {
  String typeTransaction;

  GetListTransactionParams({required this.typeTransaction});

  @override
  List<Object?> get props => [typeTransaction];
}
