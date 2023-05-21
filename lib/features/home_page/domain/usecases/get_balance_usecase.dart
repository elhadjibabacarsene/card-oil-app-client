import 'package:card_oil/core/usecases/usecases.dart';
import 'package:card_oil/features/home_page/data/models/balance_model/balance_model.dart';
import 'package:card_oil/features/home_page/data/repositories/balance_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../single_app.dart';

class GetBalance implements UseCases<BalanceModel, NoParams> {
  @override
  Future<Either<Failure, BalanceModel>> call(NoParams noParams) async {
    return await sl<BalanceRepositoryImpl>().getBalance();
  }
}
