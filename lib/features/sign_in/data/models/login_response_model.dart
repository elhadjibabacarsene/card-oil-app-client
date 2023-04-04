import 'dart:convert';

import 'package:card_oil/features/sign_in/domain/entities/login_response.dart';

LoginResponseModel loginResponseFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel extends LoginResponse {
  LoginResponseModel({
    code,
    message,
    token,
  }) : super(code: code, message: message, token: token);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        code: json["code"],
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "token": token,
      };
}
