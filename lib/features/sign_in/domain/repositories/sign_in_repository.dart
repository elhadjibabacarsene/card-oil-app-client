import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/features/sign_in/data/models/login_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignInRepository {
  Future<Either<Failure, LoginResponseModel>> signIn(String phoneNumber, String password);
}
