part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

class Step1DataGetIt extends SignUpState {
  final Registration registration;

  const Step1DataGetIt({required this.registration});

  @override
  List<Object> get props => [registration];
}

class Step2DataGetIt extends SignUpState {
  final Registration registration;

  const Step2DataGetIt({required this.registration});

  @override
  List<Object> get props => [registration];
}

class SignUpError extends SignUpState {
  final String message;

  const SignUpError({required this.message});

  @override
  List<Object> get props => [message];
}

class SignUpLoading extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpSuccess extends SignUpState {
  @override
  List<Object> get props => [];
}
