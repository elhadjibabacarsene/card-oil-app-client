import 'package:card_oil/features/home_page/data/models/balance_model/balance_model.dart';

import '../../domain/entities/balance_entity.dart';

abstract class BalanceDataSource {
  Future<BalanceModel> getBalance();
}
