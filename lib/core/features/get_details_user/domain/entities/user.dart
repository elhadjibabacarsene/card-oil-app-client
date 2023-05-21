import 'dart:convert';

import 'country.dart';
import 'wallet.dart';

class User {
  final int? id;
  final String? name;
  final String? firstname;
  final String? lastname;
  final String? phoneNumber;
  final Wallet? wallet;
  final Country? country;
  final List<String>? roles;

  User({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.phoneNumber,
    this.wallet,
    this.country,
    this.roles,
  });

  User copyWith({
    int? id,
    String? name,
    String? firstname,
    String? lastname,
    String? phoneNumber,
    Wallet? wallet,
    Country? country,
    List<String>? roles,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        wallet: wallet ?? this.wallet,
        country: country ?? this.country,
        roles: roles ?? this.roles,
      );
}