import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/core/usecases/usecases.dart';
import 'package:card_oil/features/sign_up/data/datasources/sign_up_datasource_impl.dart';
import 'package:card_oil/features/sign_up/data/repositories/sign_up_repository_impl.dart';
import 'package:card_oil/features/sign_up/domain/entities/registration.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignUp implements UseCases<bool, SignUpParams> {
  @override
  Future<Either<Failure, bool>> call(SignUpParams signUpParams) async {
    final SignUpRepositoryImpl signUpRepositoryImpl =
        SignUpRepositoryImpl(signUpDataSource: SignUpDataSourceImpl());
    return signUpRepositoryImpl.signUp(registration: signUpParams.registration);
  }
}

class SignUpParams extends Equatable {
  final Registration registration;

  const SignUpParams({required this.registration});

  @override
  List<Object?> get props => [registration];
}
