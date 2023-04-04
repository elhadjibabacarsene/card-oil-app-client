import 'package:card_oil/core/error/exceptions.dart';
import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/features/home_page/data/datasources/balance_datasource_impl.dart';
import 'package:card_oil/features/home_page/data/models/balance_model/balance_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/balance_repository.dart';

class BalanceRepositoryImpl implements BalanceRepository {
  final BalanceDataSourceImpl balanceDataSourceImpl;

  BalanceRepositoryImpl({required this.balanceDataSourceImpl});

  @override
  Future<Either<Failure, BalanceModel>> getBalance(
      {required String idUser}) async {
    try {
      final BalanceModel balanceModel =
          await balanceDataSourceImpl.getBalance(idUser: idUser);
      return Right(balanceModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }
}
