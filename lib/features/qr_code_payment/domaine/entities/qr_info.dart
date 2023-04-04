// To parse this JSON data, do
//
//     final qrInfo = qrInfoFromJson(jsonString);

import 'dart:convert';

QrInfo qrInfoFromJson(String str) => QrInfo.fromJson(json.decode(str));

String qrInfoToJson(QrInfo data) => json.encode(data.toJson());

class QrInfo {
  QrInfo({
    this.receiverName,
    this.receiverPhone,
    this.expiryDate,
    this.timestamp,
  });

  String? receiverName;
  String? receiverPhone;
  String? expiryDate;
  String? timestamp;

  factory QrInfo.fromJson(Map<String, dynamic> json) => QrInfo(
    receiverName: json["receiverName"],
    receiverPhone: json["receiverPhone"],
    expiryDate: json["expiryDate"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "receiverName": receiverName,
    "receiverPhone": receiverPhone,
    "expiryDate": expiryDate,
    "timestamp": timestamp,
  };
}
