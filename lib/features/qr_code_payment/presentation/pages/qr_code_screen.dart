import 'package:card_oil/core/bloc/user_details_bloc/user_details_bloc.dart';
import 'package:card_oil/features/qr_code_payment/presentation/bloc/generate_qr_code_bloc/generate_qr_code_bloc.dart';
import 'package:card_oil/features/qr_code_payment/presentation/pages/qr_code_body_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors/app_colors.dart';
import '../../domaine/entities/qr_info.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyQuaternaryColor,
      appBar: AppBar(
        title: const Text('Scannez-moi'),
      ),
      body: BlocBuilder<UserDetailsBloc, UserDetailsState>(
          builder: (context, state) {
        return state is UserDetailsIsLoaded
            ? BlocProvider(
                create: (_) => GenerateQrCodeBloc()
                  ..add(
                    GenerateQrCode(
                      qrCodeInfo: QrInfo(
                        receiverName: state.userDetails.nomComplete,
                        receiverPhone: state.userDetails.username,
                      ),
                    ),
                  ),
                child: const QrCodeBodyScreen())
            : Container();
      }),
    );
  }
}
