import 'package:card_oil/core/helpers/http_helper.dart';
import 'package:card_oil/features/sign_up/data/datasources/sign_up_datasource.dart';
import 'package:card_oil/features/sign_up/domain/entities/registration.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';

class SignUpDataSourceImpl extends HttpHelper implements SignUpDataSource {
  @override
  Future<bool> signUp({required Registration registration}) async {
    try {
      final Response res = await api.post(
        '$BASE_URL/clients',
        data: registration.toJson(),
      );
      if (res.statusCode == 200) {
        return true;
      }
      return true;
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 422) {
          throw ServerException(
              message: 'Ce numéro de téléphone est a déjà un compte associé');
        }
      }
      throw ServerException(message: 'Server Error');
    }
  }
}
