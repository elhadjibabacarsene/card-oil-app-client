part of 'generate_qr_code_bloc.dart';

abstract class GenerateQrCodeEvent extends Equatable {
  const GenerateQrCodeEvent();
}

class GenerateQrCode extends GenerateQrCodeEvent {
  final QrInfo qrCodeInfo;

  const GenerateQrCode({required this.qrCodeInfo});

  @override
  List<Object> get props => [qrCodeInfo];
}
