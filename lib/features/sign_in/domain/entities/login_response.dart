class LoginResponse {
  LoginResponse({
    this.code,
    this.message,
    this.token,
  });

  int? code;
  String? message;
  String? token;
}
