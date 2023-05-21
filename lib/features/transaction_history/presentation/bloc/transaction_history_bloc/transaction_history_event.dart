part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryEvent extends Equatable {
  const TransactionHistoryEvent();
}

class GetTransactionHistory extends TransactionHistoryEvent {
  final String typeTransaction;

  const GetTransactionHistory({required this.typeTransaction});

  @override
  List<Object> get props => [typeTransaction];
}
