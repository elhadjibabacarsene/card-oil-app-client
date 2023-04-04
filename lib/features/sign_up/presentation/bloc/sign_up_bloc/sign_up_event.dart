part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class GetStep1Data extends SignUpEvent {
  final Registration registration;

  const GetStep1Data({required this.registration});

  @override
  List<Object> get props => [registration];
}

class GetStep2Data extends SignUpEvent {
  final Registration registration;

  const GetStep2Data({required this.registration});

  @override
  List<Object> get props => [registration];
}
