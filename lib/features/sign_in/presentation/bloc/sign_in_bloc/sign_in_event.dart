part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignInWithPhoneNumberAndPwd extends SignInEvent {
  final String phoneNumber;
  final String password;

  const SignInWithPhoneNumberAndPwd({
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object> get props => [phoneNumber, password];
}
