
import 'dart:convert';

import '../../domain/entities/user.dart';
import 'country_model.dart';
import 'wallet_model.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  UserModel({
    id,
    name,
    firstname,
    lastname,
    phoneNumber,
    wallet,
    country,
    roles,
  }) : super(
          id: id,
          name: name,
          firstname: firstname,
          lastname: lastname,
          phoneNumber: phoneNumber,
          wallet: wallet,
          country: country,
          roles: roles,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phoneNumber: json["phone_number"],
        wallet: json["wallet"] == null
            ? null
            : WalletModel.fromJson(json["wallet"]),
        country: json["country"] == null
            ? null
            : CountryModel.fromJson(json["country"]),
        roles: json["roles"] == null
            ? []
            : List<String>.from(json["roles"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstname": firstname,
        "lastname": lastname,
        "phone_number": phoneNumber,
        "wallet": wallet == null
            ? null
            : WalletModel(
                number: wallet?.number,
                balance: wallet?.balance,
                isBlocked: wallet?.isBlocked,
              ).toJson(),
        "country": country == null
            ? null
            : CountryModel(
                name: country?.name,
                code: country?.code,
                dialingCode: country?.dialingCode,
              ).toJson(),
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
      };
}
