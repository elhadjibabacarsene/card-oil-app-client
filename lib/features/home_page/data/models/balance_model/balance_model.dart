// To parse this JSON data, do
//
//     final balance = balanceFromJson(jsonString);

import 'dart:convert';

BalanceModel balanceFromJson(String str) => BalanceModel.fromJson(json.decode(str));

String balanceToJson(BalanceModel data) => json.encode(data.toJson());

class BalanceModel {
  BalanceModel({
    this.balance,
  });

  final int? balance;

  factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
  };
}
