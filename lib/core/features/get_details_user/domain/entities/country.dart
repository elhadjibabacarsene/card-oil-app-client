class Country {
  final String? code;
  final String? name;
  final String? dialingCode;

  Country({
    this.code,
    this.name,
    this.dialingCode,
  });

  Country copyWith({
    String? code,
    String? name,
    String? dialingCode,
  }) =>
      Country(
        code: code ?? this.code,
        name: name ?? this.name,
        dialingCode: dialingCode ?? this.dialingCode,
      );
}