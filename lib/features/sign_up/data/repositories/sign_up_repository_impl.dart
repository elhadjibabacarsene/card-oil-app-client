import 'package:card_oil/core/error/exceptions.dart';
import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/features/sign_up/domain/entities/registration.dart';
import 'package:card_oil/features/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/sign_up_datasource.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataSource signUpDataSource;

  SignUpRepositoryImpl({required this.signUpDataSource});

  @override
  Future<Either<Failure, bool>> signUp(
      {required Registration registration}) async {
    try {
      final bool = await signUpDataSource.signUp(registration: registration);
      return Right(bool);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }
}
