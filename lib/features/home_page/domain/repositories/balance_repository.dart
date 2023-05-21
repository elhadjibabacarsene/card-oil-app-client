import 'package:card_oil/features/home_page/data/models/balance_model/balance_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class BalanceRepository {
  Future<Either<Failure, BalanceModel>> getBalance();
}