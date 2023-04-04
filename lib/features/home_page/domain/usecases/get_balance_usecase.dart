import 'package:card_oil/core/usecases/usecases.dart';
import 'package:card_oil/features/home_page/data/models/balance_model/balance_model.dart';
import 'package:card_oil/features/home_page/data/repositories/balance_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../single_app.dart';

class GetBalance implements UseCases<BalanceModel, GetBalanceParams> {
  @override
  Future<Either<Failure, BalanceModel>> call(GetBalanceParams getBalanceParams) async {
    return await sl<BalanceRepositoryImpl>().getBalance(idUser: getBalanceParams.idUser);
  }
}

class GetBalanceParams extends Equatable {
  String idUser;

  GetBalanceParams({required this.idUser});

  @override
  List<Object?> get props => [idUser];
}
