import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../entities/user.dart';

abstract class DetailsUserRepository {
  Future<Either<Failure, User>> getDetailsUser();
}
