import 'package:card_oil/features/sign_in/data/datasources/sign_in_data_source_impl.dart';
import 'package:card_oil/features/sign_in/data/models/login_response_model.dart';
import 'package:card_oil/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInDataSourceImpl signInDataSourceImpl;

  SignInRepositoryImpl({required this.signInDataSourceImpl});

  @override
  Future<Either<Failure, LoginResponseModel>> signIn(
      String phoneNumber, String password) async {
    try {
      final LoginResponseModel loginResponseModel =
          await signInDataSourceImpl.signIn(phoneNumber, password);
      return Right(loginResponseModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }
}
