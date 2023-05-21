import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpHelper {
  final Dio api = Dio();
  final String BASE_URL = 'http://185.98.136.211:8080/api';

  HttpHelper() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      bool isContainsPath(String path) {
        return options.path.contains(path);
      }

      if (!options.path.contains("http")) {
        options.path = BASE_URL + options.path;
      }
      if (!isContainsPath("/login") && !isContainsPath("/clients")) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        var accessToken = sharedPreferences.get('token');
        options.headers['Authorization'] = 'Bearer $accessToken';
        options.responseType = ResponseType.plain;
        options.contentType = 'application/json';
      }
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      if ((error.response?.statusCode == 401)) {
        /*
        if (await refreshToken(refreshtoken)) {
          return handler.resolve(await _retry(error.requestOptions));
        }*/
      }
      return handler.next(error);
    }));
  }

  Future<bool> refreshToken(String refreshToken) async {
    // ignore: avoid_print
    print('TOKEN IS REFRESHED');
    return true;
    // final response = await api
    //     .post('$BASE_URL/auth/refresh', data: {'refreshToken': refreshToken});
    // if (response.statusCode == 201) {
    //   refreshToken = response.data;
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
