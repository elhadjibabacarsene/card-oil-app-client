// To parse this JSON data, do
//
//     final transactionListModel = transactionListModelFromJson(jsonString);

import 'dart:convert';

import 'transaction_model.dart';

TransactionListModel transactionListModelFromJson(String str) =>
    TransactionListModel.fromJson(json.decode(str));

String transactionListModelToJson(TransactionListModel data) =>
    json.encode(data.toJson());

class TransactionListModel {
  final List<TransactionModel>? data;
  final String? message;

  TransactionListModel({
    this.data,
    this.message,
  });

  TransactionListModel copyWith({
    List<TransactionModel>? data,
    String? message,
  }) =>
      TransactionListModel(
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      TransactionListModel(
        data: json["data"] == null
            ? []
            : List<TransactionModel>.from(
                json["data"]!.map((x) => TransactionModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}
