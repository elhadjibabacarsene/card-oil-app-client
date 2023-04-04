part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryEvent extends Equatable {
  const TransactionHistoryEvent();
}

class GetTransactionHistory extends TransactionHistoryEvent {
  final String idUser;
  final String walletType;

  const GetTransactionHistory({required this.idUser, required this.walletType});

  @override
  List<Object> get props => [idUser, walletType];
}
