import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/core/features/get_details_user/data/repositories/details_users_repository_impl.dart';
import 'package:card_oil/core/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

import '../../../../../single_app.dart';
import '../entities/user.dart';

class GetDetailsUser implements UseCases<User, NoParams> {
  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return sl<DetailsUserRepositoryImpl>().getDetailsUser();
  }
}
