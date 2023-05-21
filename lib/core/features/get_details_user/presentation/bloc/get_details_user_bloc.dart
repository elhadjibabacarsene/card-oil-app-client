import 'package:bloc/bloc.dart';
import 'package:card_oil/core/features/get_details_user/domain/entities/user.dart';
import 'package:card_oil/core/features/get_details_user/domain/usecases/get_details_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../error/failure.dart';
import '../../../../helpers/token_helper.dart';
import '../../../../usecases/usecases.dart';

part 'get_details_user_event.dart';

part 'get_details_user_state.dart';

class GetDetailsUserBloc
    extends Bloc<GetDetailsUserEvent, GetDetailsUserState> {
  final GetDetailsUser getDetailsUser = GetDetailsUser();
  final TokenHelper tokenHelper = TokenHelper();

  GetDetailsUserBloc() : super(GetDetailsUserInitial()) {
    on<ToGetDetailsUser>((event, emit) async {
      emit(GetDetailsUserLoading());
      if (await tokenHelper.getToken() != null) {
        final Either<Failure, User> failureOrUser =
            await getDetailsUser(NoParams());
        emit(
          failureOrUser.fold(
            (failure) => GetDetailsUserError(message: failure.errorMessage),
            (user) => GetDetailsUserLoaded(user: user),
          ),
        );
      }else{
        emit(UserUnAuthenticated());
      }
    });
  }
}
