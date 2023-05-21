import 'package:card_oil/features/sign_in/data/datasources/sign_in_data_source.dart';
import 'package:card_oil/features/sign_in/data/models/login_response_model.dart';
import 'package:card_oil/core/helpers/http_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

class SignInDataSourceImpl extends HttpHelper implements SignInDataSource {
  @override
  Future<LoginResponseModel> signIn(String phoneNumber, String password) async {
    try {
      final Response res = await api.post('$BASE_URL/login',
          data: {'phone_number': phoneNumber.replaceAll(' ', ''), 'password': password});
      if(res.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', res.data['access_token']);
      }
      return LoginResponseModel.fromJson(res.data);
    } on DioError catch (e) {
      print(e.message);
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          throw ServerException(message: 'Login ou mot de passe incorrect');
        }
      }
      throw ServerException(message: 'Server Error');
    }
  }
}
