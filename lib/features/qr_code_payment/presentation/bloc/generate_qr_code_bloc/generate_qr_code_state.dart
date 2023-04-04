part of 'generate_qr_code_bloc.dart';

abstract class GenerateQrCodeState extends Equatable {
  const GenerateQrCodeState();
}

class GenerateQrCodeInitial extends GenerateQrCodeState {
  @override
  List<Object> get props => [];
}

class GenerateQrCodeLoading extends GenerateQrCodeState {
  @override
  List<Object> get props => [];
}

class GenerateQrCodeSuccess extends GenerateQrCodeState {
  final String qrCode;

  const GenerateQrCodeSuccess(this.qrCode);

  @override
  List<Object> get props => [qrCode];
}

class GenerateQrCodeFailure extends GenerateQrCodeState {
  final String message;

  const GenerateQrCodeFailure(this.message);

  @override
  List<Object> get props => [message];
}
