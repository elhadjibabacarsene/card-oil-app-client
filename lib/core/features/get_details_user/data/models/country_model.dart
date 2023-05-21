

import '../../domain/entities/country.dart';

class CountryModel extends Country {
  CountryModel({
    name,
    code,
    dialingCode,
  }) : super(
          name: name,
          code: code,
          dialingCode: dialingCode,
        );

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"],
        code: json["code"],
        dialingCode: json["dialing_code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "dialing_code": dialingCode,
      };
}
