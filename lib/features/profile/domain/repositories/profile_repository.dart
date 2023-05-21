import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class ProfileRepository {
  Future<Either<Failure, bool>> logout();
}