import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/registration.dart';
import '../../../domain/usecases/sign_up_usecase.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUp signUp = SignUp();

  SignUpBloc() : super(SignUpInitial()) {
    on<GetStep1Data>((event, emit) {
      emit(Step1DataGetIt(registration: event.registration));
    });
    on<GetStep2Data>((event, emit) async {
      emit(SignUpLoading());
      final Registration registration = event.registration.copyWith(country: Country(libelle: "Sénégal"));
      final Either<Failure, bool> failureOrLoginResponseModel =
          await signUp(SignUpParams(registration: registration));
      emit(failureOrLoginResponseModel.fold(
          (failure) => SignUpError(message: failure.errorMessage),
          (bool) => SignUpSuccess()));
    });
  }
}
