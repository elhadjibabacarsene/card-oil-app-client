class LoginResponse {
  LoginResponse({this.accessToken, this.tokenType, this.expiresIn});

  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
}
