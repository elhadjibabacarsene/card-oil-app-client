import 'package:bloc/bloc.dart';
import 'package:card_oil/core/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecases/logout_usecase.dart';

part 'logout_event.dart';

part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogOut logout = LogOut();

  LogoutBloc() : super(LogoutInitial()) {
    on<Logout>((event, emit) async {
      emit(LogoutLoading());
      final Either<Failure, bool> failureOrLogout = await logout(NoParams());
      emit(
        failureOrLogout.fold(
          (failure) => LogoutError(message: failure.errorMessage),
          (logout) => logout == true
              ? LogoutSuccess()
              : const LogoutError(message: 'Une erreur est survenue'),
        ),
      );
    });
  }
}
