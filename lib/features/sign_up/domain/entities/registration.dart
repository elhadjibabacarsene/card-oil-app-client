// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

Registration registrationModelFromJson(String str) => Registration.fromJson(json.decode(str));

String registrationModelToJson(Registration data) => json.encode(data.toJson());

class Registration {
  Registration({
    this.phonenumber,
    this.password,
    this.firstname,
    this.lastname,
    this.country,
  });

  final String? phonenumber;
  final String? password;
  final String? firstname;
  final String? lastname;
  final Country? country;

  Registration copyWith({
    String? phonenumber,
    String? password,
    String? firstname,
    String? lastname,
    Country? country,
  }) =>
      Registration(
        phonenumber: phonenumber ?? this.phonenumber,
        password: password ?? this.password,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        country: country ?? this.country,
      );

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
    phonenumber: json["phonenumber"],
    password: json["password"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
  );

  Map<String, dynamic> toJson() => {
    "phonenumber": phonenumber,
    "password": password,
    "firstname": firstname,
    "lastname": lastname,
    "country": country?.toJson(),
  };
}

class Country {
  Country({
    this.libelle,
  });

  final String? libelle;

  Country copyWith({
    String? libelle,
  }) =>
      Country(
        libelle: libelle ?? this.libelle,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    libelle: json["libelle"],
  );

  Map<String, dynamic> toJson() => {
    "libelle": libelle,
  };
}
