// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
  final String? transactionReference;
  final String? amount;
  final String? status;
  final dynamic failureReason;
  final dynamic quantity;
  final DateTime? createdAt;
  final int? litersCount;
  final Receiver? sender;
  final Receiver? receiver;
  final TransactionType? transactionType;
  final Station? station;
  final dynamic product;

  TransactionModel({
    this.transactionReference,
    this.amount,
    this.status,
    this.failureReason,
    this.quantity,
    this.createdAt,
    this.litersCount,
    this.sender,
    this.receiver,
    this.transactionType,
    this.station,
    this.product,
  });

  TransactionModel copyWith({
    String? transactionReference,
    String? amount,
    String? status,
    dynamic failureReason,
    dynamic quantity,
    DateTime? createdAt,
    int? litersCount,
    Receiver? sender,
    Receiver? receiver,
    TransactionType? transactionType,
    Station? station,
    dynamic product,
  }) =>
      TransactionModel(
        transactionReference: transactionReference ?? this.transactionReference,
        amount: amount ?? this.amount,
        status: status ?? this.status,
        failureReason: failureReason ?? this.failureReason,
        quantity: quantity ?? this.quantity,
        createdAt: createdAt ?? this.createdAt,
        litersCount: litersCount ?? this.litersCount,
        sender: sender ?? this.sender,
        receiver: receiver ?? this.receiver,
        transactionType: transactionType ?? this.transactionType,
        station: station ?? this.station,
        product: product ?? this.product,
      );

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    transactionReference: json["transaction_reference"],
    amount: json["amount"],
    status: json["status"],
    failureReason: json["failure_reason"],
    quantity: json["quantity"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    litersCount: json["liters_count"],
    sender: json["sender"] == null ? null : Receiver.fromJson(json["sender"]),
    receiver: json["receiver"] == null ? null : Receiver.fromJson(json["receiver"]),
    transactionType: json["transaction_type"] == null ? null : TransactionType.fromJson(json["transaction_type"]),
    station: json["station"] == null ? null : Station.fromJson(json["station"]),
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_reference": transactionReference,
    "amount": amount,
    "status": status,
    "failure_reason": failureReason,
    "quantity": quantity,
    "created_at": createdAt?.toIso8601String(),
    "liters_count": litersCount,
    "sender": sender?.toJson(),
    "receiver": receiver?.toJson(),
    "transaction_type": transactionType?.toJson(),
    "station": station?.toJson(),
    "product": product,
  };
}

class Receiver {
  final String? name;
  final String? phoneNumber;

  Receiver({
    this.name,
    this.phoneNumber,
  });

  Receiver copyWith({
    String? name,
    String? phoneNumber,
  }) =>
      Receiver(
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
    name: json["name"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone_number": phoneNumber,
  };
}

class Station {
  final String? name;
  final String? region;

  Station({
    this.name,
    this.region,
  });

  Station copyWith({
    String? name,
    String? region,
  }) =>
      Station(
        name: name ?? this.name,
        region: region ?? this.region,
      );

  factory Station.fromJson(Map<String, dynamic> json) => Station(
    name: json["name"],
    region: json["region"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
  };
}

class TransactionType {
  final String? name;

  TransactionType({
    this.name,
  });

  TransactionType copyWith({
    String? name,
  }) =>
      TransactionType(
        name: name ?? this.name,
      );

  factory TransactionType.fromJson(Map<String, dynamic> json) => TransactionType(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
