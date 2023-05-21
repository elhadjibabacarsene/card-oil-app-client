import 'dart:convert';

import 'package:card_oil/features/sign_in/domain/entities/login_response.dart';

LoginResponseModel loginResponseFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel extends LoginResponse {
  LoginResponseModel({
    accessToken,
    tokenType,
    expiresIn,
  }) : super(
          accessToken: accessToken,
          tokenType: tokenType,
          expiresIn: expiresIn,
        );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
