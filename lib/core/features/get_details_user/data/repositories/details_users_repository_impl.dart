import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/core/features/get_details_user/data/datasources/details_user_datasource_impl.dart';
import 'package:card_oil/core/features/get_details_user/domain/entities/user.dart';
import 'package:card_oil/core/features/get_details_user/domain/repositories/details_user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../error/exceptions.dart';

class DetailsUserRepositoryImpl implements DetailsUserRepository {
  final DetailsUserDataSourceImpl detailsUserDataSourceImpl;

  DetailsUserRepositoryImpl({required this.detailsUserDataSourceImpl});

  @override
  Future<Either<Failure, User>> getDetailsUser() async {
    try {
      final User user =
      await detailsUserDataSourceImpl.getDetailsUser();
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }

}