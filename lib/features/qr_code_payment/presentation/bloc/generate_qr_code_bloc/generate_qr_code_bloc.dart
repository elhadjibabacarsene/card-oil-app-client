import 'package:bloc/bloc.dart';
import 'package:card_oil/features/qr_code_payment/domaine/entities/qr_info.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/helpers/key_helper.dart';

part 'generate_qr_code_event.dart';

part 'generate_qr_code_state.dart';

class GenerateQrCodeBloc
    extends Bloc<GenerateQrCodeEvent, GenerateQrCodeState> {
  GenerateQrCodeBloc() : super(GenerateQrCodeInitial()) {
    on<GenerateQrCode>((event, emit) async {
      final AESEncryption encryption = AESEncryption();
      while (true) {
        emit(GenerateQrCodeLoading());
// add expiration and timestamp
        final QrInfo qrInfo = event.qrCodeInfo;
        DateTime now = DateTime.now();

        qrInfo.expiryDate =
            now.add(const Duration(seconds: 1)).toIso8601String();
        qrInfo.timestamp = now.toIso8601String();
// encrypt qr code
        String qrCrypt = encryption.encryptMsg(qrInfo.receiverPhone.toString()).base16;

        emit(GenerateQrCodeSuccess(qrCrypt));

        // Pause de 1 minute
        await Future.delayed(const Duration(seconds: 1));
      }
    });
  }
}
