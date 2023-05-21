import 'package:card_oil/core/features/get_details_user/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../error/exceptions.dart';
import '../../../../helpers/http_helper.dart';
import '../../domain/entities/user.dart';
import 'details_user_datasource.dart';

class DetailsUserDataSourceImpl extends HttpHelper
    implements DetailsUserDataSource {
  @override
  Future<User> getDetailsUser() async {
    try {
      final Response res = await api.post('$BASE_URL/me');
      debugPrint(res.data);
      return userFromJson(res.data);
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.statusCode.toString());
        if (e.response!.statusCode == 401) {
          throw ServerException(message: 'Vous n\'êtes pas connecté !');
        }else if(e.response!.statusCode == 302){
          throw ServerException(message: 'Session expirée !');
        }
      }
      throw ServerException(message: 'Server Error');
    }
  }
}
