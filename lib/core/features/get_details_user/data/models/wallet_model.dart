import '../../domain/entities/wallet.dart';

class WalletModel extends Wallet {
  WalletModel({
    number,
    balance,
    isBlocked,
  }) : super(
          number: number,
          balance: balance,
          isBlocked: isBlocked,
        );

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    number: json["number"],
    balance: json["balance"],
    isBlocked: json["is_blocked"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "balance": balance,
    "is_blocked": isBlocked,
  };
  Map<String, dynamic> toModelJson() => toJson();
}