import 'package:card_oil/core/usecases/usecases.dart';
import 'package:card_oil/features/sign_in/data/models/login_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../single_app.dart';
import '../../data/repositories/sign_in_repository_impl.dart';

class SignIn implements UseCases<LoginResponseModel, SignInParams> {
  @override
  Future<Either<Failure, LoginResponseModel>> call(SignInParams signInParams) {
    final SignInRepositoryImpl signInRepositoryImpl =
        sl<SignInRepositoryImpl>();
    return signInRepositoryImpl.signIn(
        signInParams.phonenumber, signInParams.password);
  }
}

class SignInParams extends Equatable {
  String phonenumber;
  String password;

  SignInParams({required this.phonenumber, required this.password});

  @override
  List<Object?> get props => [phonenumber, password];
}
