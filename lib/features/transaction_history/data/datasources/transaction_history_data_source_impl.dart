import 'dart:convert';

import 'package:card_oil/core/helpers/http_helper.dart';
import 'package:card_oil/features/transaction_history/data/datasources/transaction_history_data_source.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../models/transaction_history_model.dart';

class TransactionHistoryDataSourceImpl extends HttpHelper
    implements TransactionHistoryDataSource {
  @override
  Future<TransactionHistory> getTransactionHistory(
      {required String idUser, required String walletType}) async {
    try {
      final res =
          await api.get('$BASE_URL/transactions?$walletType.owner.id=$idUser');
      return TransactionHistory.fromJson(json.decode(res.data));
    } on DioError catch (e) {
      throw ServerException(message: 'Server Error');
    }
  }
}
