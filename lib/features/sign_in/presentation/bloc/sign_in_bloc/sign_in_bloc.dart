import 'package:bloc/bloc.dart';
import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/features/sign_in/data/models/login_response_model.dart';
import 'package:card_oil/features/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignIn signIn = SignIn();

  SignInBloc() : super(SignInInitial()) {
    on<SignInWithPhoneNumberAndPwd>((event, emit) async {
      emit(SignInLoading());
      final Either<Failure, LoginResponseModel> failureOrLoginResponseModel =
          await signIn(SignInParams(
              phonenumber: event.phoneNumber, password: event.password));

      emit(
        failureOrLoginResponseModel.fold(
          (failure) => SignInFailure(message: failure.errorMessage),
          (loginResponseModel) => SignInSuccess(),
        ),
      );
    });
  }
}
