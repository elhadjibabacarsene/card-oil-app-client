// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

Transaction transactionFromJson(String str) =>
    Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
  Transaction({
    this.id,
    this.type,
    this.amount,
    this.createdAt,
    this.status,
    this.typeTransaction,
    this.product,
    this.station,
    this.agent,
    this.quantity,
    this.idTransaction,
  });

  final String? id;
  final String? type;
  final int? amount;
  final String? createdAt;
  final String? status;
  final TypeTransaction? typeTransaction;
  final Product? product;
  final String? station;
  final String? agent;
  final String? quantity;
  final String? idTransaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["@id"],
        type: json["@type"],
        amount: json["amount"],
        quantity: json["quantity"],
        idTransaction: json["idTransaction"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]).toIso8601String(),
        status: json["status"],
        typeTransaction: json["typeTransaction"] == null
            ? null
            : TypeTransaction.fromJson(json["typeTransaction"]),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        station: json["station"],
        agent: json["agent"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "amount": amount,
        "createdAt": createdAt,
        "status": status,
        "typeTransaction": typeTransaction?.toJson(),
        "product": product?.toJson(),
        "station": station,
        "agent": agent,
        "quantity": quantity,
        "idTransaction": idTransaction,
      };
}

class Product {
  Product({
    this.id,
    this.type,
    this.libelle,
  });

  final String? id;
  final String? type;
  final String? libelle;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["@id"],
        type: json["@type"],
        libelle: json["libelle"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "libelle": libelle,
      };
}

class TypeTransaction {
  TypeTransaction({
    this.id,
    this.type,
    this.libelle,
  });

  final String? id;
  final String? type;
  final String? libelle;

  factory TypeTransaction.fromJson(Map<String, dynamic> json) =>
      TypeTransaction(
        id: json["@id"],
        type: json["@type"],
        libelle: json["libelle"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "libelle": libelle,
      };
}
