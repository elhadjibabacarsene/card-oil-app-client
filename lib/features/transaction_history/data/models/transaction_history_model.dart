// To parse this JSON data, do
//
//     final transactionHistory = transactionHistoryFromJson(jsonString);

import 'dart:convert';

import 'package:card_oil/features/transaction_history/domain/entities/Transaction.dart';

TransactionHistory transactionHistoryFromJson(String str) => TransactionHistory.fromJson(json.decode(str));

String transactionHistoryToJson(TransactionHistory data) => json.encode(data.toJson());

class TransactionHistory {
  TransactionHistory({
    this.context,
    this.id,
    this.type,
    this.hydraMember,
    this.hydraTotalItems,
    this.hydraView,
    this.hydraSearch,
  });

  final String? context;
  final String? id;
  final String? type;
  final List<Transaction>? hydraMember;
  final int? hydraTotalItems;
  final HydraView? hydraView;
  final HydraSearch? hydraSearch;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) => TransactionHistory(
    context: json["@context"],
    id: json["@id"],
    type: json["@type"],
    hydraMember: json["hydra:member"] == null ? [] : List<Transaction>.from(json["hydra:member"]!.map((x) => Transaction.fromJson(x))),
    hydraTotalItems: json["hydra:totalItems"],
    hydraView: json["hydra:view"] == null ? null : HydraView.fromJson(json["hydra:view"]),
    hydraSearch: json["hydra:search"] == null ? null : HydraSearch.fromJson(json["hydra:search"]),
  );

  Map<String, dynamic> toJson() => {
    "@context": context,
    "@id": id,
    "@type": type,
    "hydra:member": hydraMember == null ? [] : List<dynamic>.from(hydraMember!.map((x) => x.toJson())),
    "hydra:totalItems": hydraTotalItems,
    "hydra:view": hydraView?.toJson(),
    "hydra:search": hydraSearch?.toJson(),
  };
}

class HydraSearch {
  HydraSearch({
    this.type,
    this.hydraTemplate,
    this.hydraVariableRepresentation,
    this.hydraMapping,
  });

  final String? type;
  final String? hydraTemplate;
  final String? hydraVariableRepresentation;
  final List<HydraMapping>? hydraMapping;

  factory HydraSearch.fromJson(Map<String, dynamic> json) => HydraSearch(
    type: json["@type"],
    hydraTemplate: json["hydra:template"],
    hydraVariableRepresentation: json["hydra:variableRepresentation"],
    hydraMapping: json["hydra:mapping"] == null ? [] : List<HydraMapping>.from(json["hydra:mapping"]!.map((x) => HydraMapping.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "hydra:template": hydraTemplate,
    "hydra:variableRepresentation": hydraVariableRepresentation,
    "hydra:mapping": hydraMapping == null ? [] : List<dynamic>.from(hydraMapping!.map((x) => x.toJson())),
  };
}

class HydraMapping {
  HydraMapping({
    this.type,
    this.variable,
    this.property,
    this.required,
  });

  final String? type;
  final String? variable;
  final String? property;
  final bool? required;

  factory HydraMapping.fromJson(Map<String, dynamic> json) => HydraMapping(
    type: json["@type"],
    variable: json["variable"],
    property: json["property"],
    required: json["required"],
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "variable": variable,
    "property": property,
    "required": required,
  };
}

class HydraView {
  HydraView({
    this.id,
    this.type,
  });

  final String? id;
  final String? type;

  factory HydraView.fromJson(Map<String, dynamic> json) => HydraView(
    id: json["@id"],
    type: json["@type"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id,
    "@type": type,
  };
}
