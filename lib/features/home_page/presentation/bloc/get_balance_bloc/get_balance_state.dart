part of 'get_balance_bloc.dart';

abstract class GetBalanceState extends Equatable {
  const GetBalanceState();
}

class GetBalanceInitial extends GetBalanceState {
  @override
  List<Object> get props => [];
}

class GetBalanceLoading extends GetBalanceState {
  @override
  List<Object> get props => [];
}

class GetBalanceSuccess extends GetBalanceState {
  final int balance;

  const GetBalanceSuccess({required this.balance});

  @override
  List<Object> get props => [balance];
}

class GetBalanceFailure extends GetBalanceState {
  final String message;

  const GetBalanceFailure({required this.message});

  @override
  List<Object> get props => [message];
}
