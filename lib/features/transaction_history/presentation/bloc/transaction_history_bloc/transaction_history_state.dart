part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryState extends Equatable {
  const TransactionHistoryState();
}

class TransactionHistoryInitial extends TransactionHistoryState {
  @override
  List<Object> get props => [];
}

class TransactionHistoryLoading extends TransactionHistoryState {
  @override
  List<Object> get props => [];
}

class TransactionHistoryLoaded extends TransactionHistoryState {
  final List<TransactionModel> transactions;
  final String typeTransaction;

  const TransactionHistoryLoaded({required this.transactions, required this.typeTransaction});

  @override
  List<Object> get props => [transactions];
}

class TransactionHistoryFailure extends TransactionHistoryState {
  final String message;

  const TransactionHistoryFailure({required this.message});

  @override
  List<Object> get props => [message];
}
