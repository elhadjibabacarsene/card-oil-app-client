import 'package:card_oil/core/helpers/http_helper.dart';
import 'package:card_oil/features/home_page/data/models/balance_model/balance_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/balance_entity.dart';
import 'balance_datasource.dart';

class BalanceDataSourceImpl extends HttpHelper implements BalanceDataSource {

  @override
  Future<BalanceModel> getBalance({required idUser}) async {
    try{
      var res = await api.get('$BASE_URL/users/$idUser/wallet/balance');
      return balanceFromJson(res.data);
    } on DioError catch (e) {
      throw ServerException(message: 'Server Error'); 
    }
  }
}