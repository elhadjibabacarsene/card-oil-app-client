// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    this.iat,
    this.exp,
    this.roles,
    this.username,
    this.balance,
    this.statutAccount,
    this.nomComplete,
    this.idCountry,
    this.idUser,
  });

  int? iat;
  int? exp;
  List<String>? roles;
  String? username;
  int? balance;
  bool? statutAccount;
  String? nomComplete;
  int? idCountry;
  int? idUser;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        iat: json["iat"],
        exp: json["exp"],
        roles: json["roles"] == null
            ? []
            : List<String>.from(json["roles"]!.map((x) => x)),
        username: json["username"],
        balance: json["balance"],
        statutAccount: json["statut_account"],
        nomComplete: json["nom_complete"],
        idCountry: json["idCountry"],
        idUser: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "iat": iat,
        "exp": exp,
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
        "username": username,
        "balance": balance,
        "statut_account": statutAccount,
        "nom_complete": nomComplete,
        "idCountry": idCountry,
        "id": idUser,
      };
}
