import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  @override
  final String errorMessage;
   const ServerFailure({this.errorMessage = ''}): super(errorMessage: errorMessage);
}

String getErrorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return failure.errorMessage;
    default:
      return 'Unexpected Error';
  }
}
