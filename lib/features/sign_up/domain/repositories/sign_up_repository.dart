import 'package:card_oil/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/registration.dart';

abstract class SignUpRepository {
  Future<Either<Failure, bool>> signUp({required Registration registration});
}