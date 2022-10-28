import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants/colors/app_colors.dart';
import '../../../widgets/custom_text/custom_text.dart';

class NfcBodyScreen extends StatelessWidget {
  const NfcBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            text: 'Rapprochez votre téléphone \ndu dispositif de l\'agent',
            fontSize: 18,
            customTextFontWeight: CustomTextFontWeight.regular,
            color: menthePrimaryColor,
            textAlign: TextAlign.center,
          ),
          Lottie.asset('assets/images/nfc_1.json'),
        ],
      )
    );
  }
}
