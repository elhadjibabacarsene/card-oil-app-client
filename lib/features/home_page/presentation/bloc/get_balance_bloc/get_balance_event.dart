part of 'get_balance_bloc.dart';

abstract class GetBalanceEvent extends Equatable {
  const GetBalanceEvent();
}

class ToGetBalance extends GetBalanceEvent {
  final String idUser;

  const ToGetBalance({required this.idUser});

  @override
  List<Object> get props => [idUser];
}
