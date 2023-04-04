import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/features/qr_code_payment/presentation/bloc/generate_qr_code_bloc/generate_qr_code_bloc.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeBodyScreen extends StatelessWidget {
  const QrCodeBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateQrCodeBloc, GenerateQrCodeState>(
        builder: (context, state) {
      return Center(
        child: state is GenerateQrCodeLoading
            ? const CircularProgressIndicator()
            : state is GenerateQrCodeSuccess
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: 'Présentez ce code à l\'agent',
                        fontSize: 18,
                        customTextFontWeight: CustomTextFontWeight.regular,
                        color: menthePrimaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(
                                width: 1,
                                color: greyQuinaryColor,
                              )),
                          width: 300,
                          height: 300,
                          child: QrImage(
                            data: state.qrCode,
                            version: QrVersions.auto,
                            size: 220.0,
                          ),
                        ),
                      ),
                    ],
                  )
                : const Text('Une erreur est survenue'),
      );
    });
  }
}
