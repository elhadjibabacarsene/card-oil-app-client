import 'package:bloc/bloc.dart';
import 'package:card_oil/features/home_page/data/models/balance_model/balance_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/usecases/get_balance_usecase.dart';

part 'get_balance_event.dart';

part 'get_balance_state.dart';

class GetBalanceBloc extends Bloc<GetBalanceEvent, GetBalanceState> {
  final GetBalance getBalance = GetBalance();

  GetBalanceBloc() : super(GetBalanceInitial()) {
    on<ToGetBalance>((event, emit) async {
      emit(GetBalanceLoading());
      final Either<Failure, BalanceModel> failureOrBalance =
          await getBalance(GetBalanceParams(idUser: event.idUser));
      emit(failureOrBalance.fold(
          (failure) => GetBalanceFailure(message: failure.errorMessage),
          (balanceModel) => balanceModel.balance != null
              ? GetBalanceSuccess(balance: balanceModel.balance!)
              : const GetBalanceFailure(message: 'Balance is null')));
    });
  }
}
