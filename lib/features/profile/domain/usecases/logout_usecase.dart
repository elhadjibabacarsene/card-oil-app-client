import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';
import '../../../../single_app.dart';

class LogOut implements UseCases<bool, NoParams> {
  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return sl<ProfileRepositoryImpl>().logout();
  }
}
