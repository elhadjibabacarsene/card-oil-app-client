import 'package:card_oil/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CheckAccountRepository {
  Future<Either<Failure, bool>> checkAccountByPhoneNumber(
      {required String phoneNumber});
  Future<Either<Failure, String>> sendCodeOtp({required String phoneNumber});
  Future<Either<Failure, bool>> validateOtp({required String verificationId, required String smsCode});
}
