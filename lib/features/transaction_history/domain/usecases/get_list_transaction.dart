import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../../../../single_app.dart';
import '../../data/models/transaction_history_model.dart';
import '../../data/repositories/transaction_history_repository_impl.dart';

class GetListTransaction
    implements UseCases<TransactionHistory, GetListTransactionParams> {
  @override
  Future<Either<Failure, TransactionHistory>> call(
      GetListTransactionParams getListTransactionParams) async {
    final TransactionHistoryRepositoryImpl transactionHistoryRepository =
        sl<TransactionHistoryRepositoryImpl>();
    return await transactionHistoryRepository.getTransactionHistory(
      idUser: getListTransactionParams.idUser,
      walletType: getListTransactionParams.walletType,
    );
  }
}

class GetListTransactionParams extends Equatable {
  String idUser;
  String walletType;

  GetListTransactionParams({required this.idUser, required this.walletType});

  @override
  List<Object?> get props => [idUser, walletType];
}
