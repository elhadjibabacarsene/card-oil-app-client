import 'package:card_oil/core/helpers/http_helper.dart';
import 'package:card_oil/features/profile/data/datasource/profile_datasource.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

class ProfileDataSourceImpl extends HttpHelper implements ProfileDataSource {
  @override
  Future<bool> logout() async {
    try {
      final Response res = await api.post('$BASE_URL/logout');
      if (res.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('token');
        return true;
      }
      return false;
    } on DioError catch (e) {
      throw ServerException(message: 'Une erreur est survenue');
    }
  }
}
