import 'dart:convert';

import 'package:card_oil/core/helpers/http_helper.dart';
import 'package:card_oil/features/transaction_history/data/datasources/transaction_history_data_source.dart';
import 'package:card_oil/features/transaction_history/data/models/transaction_list_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';

class TransactionHistoryDataSourceImpl extends HttpHelper
    implements TransactionHistoryDataSource {
  @override
  Future<TransactionListModel> getTransactionHistory(
      {required String typeTransaction}) async {
    try {
      final res = await api
          .get('$BASE_URL/user/transactions?transaction_type=$typeTransaction');
      return TransactionListModel.fromJson(json.decode(res.data));
    } on DioError catch (e) {
      throw ServerException(message: 'Server Error');
    }
  }
}
