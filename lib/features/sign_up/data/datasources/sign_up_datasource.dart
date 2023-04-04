import '../../domain/entities/registration.dart';

abstract class SignUpDataSource {
  Future<bool> signUp({required Registration registration});
}
