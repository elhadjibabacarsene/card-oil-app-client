import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/features/profile/data/datasource/profile_datasource_impl.dart';
import 'package:card_oil/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSourceImpl profileDataSourceImpl;

  ProfileRepositoryImpl({required this.profileDataSourceImpl});

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final bool logoutRes = await profileDataSourceImpl.logout();
      return Right(logoutRes);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }
}
