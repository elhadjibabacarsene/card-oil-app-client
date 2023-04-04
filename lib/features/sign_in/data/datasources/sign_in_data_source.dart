
import '../models/login_response_model.dart';

abstract class SignInDataSource {
  Future<LoginResponseModel> signIn(String phoneNumber, String password);
}
