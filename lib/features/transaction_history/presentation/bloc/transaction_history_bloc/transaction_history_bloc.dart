import 'package:bloc/bloc.dart';
import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/features/transaction_history/data/models/transaction_history_model.dart';
import 'package:card_oil/features/transaction_history/data/models/transaction_list_model.dart';
import 'package:card_oil/features/transaction_history/domain/entities/Transaction.dart';
import 'package:card_oil/features/transaction_history/domain/usecases/get_list_transaction.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/transaction_model.dart';

part 'transaction_history_event.dart';

part 'transaction_history_state.dart';

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  final GetListTransaction getListTransaction = GetListTransaction();

  TransactionHistoryBloc() : super(TransactionHistoryInitial()) {
    on<GetTransactionHistory>((event, emit) async {
      emit(TransactionHistoryLoading());
      final Either<Failure, TransactionListModel> failureOrTransactionHistory =
          await getListTransaction(GetListTransactionParams(typeTransaction: event.typeTransaction));
      emit(
        failureOrTransactionHistory.fold(
            (failure) =>
                TransactionHistoryFailure(message: failure.errorMessage),
            (transactionListModel) => TransactionHistoryLoaded(
                typeTransaction: event.typeTransaction,
                transactions: transactionListModel.data ?? [])),
      );
    });
  }
}
