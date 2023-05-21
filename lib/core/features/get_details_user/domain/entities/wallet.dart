class Wallet {
  final String? number;
  final int? balance;
  final bool? isBlocked;

  Wallet({
    this.number,
    this.balance,
    this.isBlocked,
  });

  Wallet copyWith({
    String? number,
    int? balance,
    bool? isBlocked,
  }) =>
      Wallet(
        number: number ?? this.number,
        balance: balance ?? this.balance,
        isBlocked: isBlocked ?? this.isBlocked,
      );
}