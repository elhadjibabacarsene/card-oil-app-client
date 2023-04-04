import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/features/check_account/presentation/widgets/otp_form.dart';
import 'package:flutter/material.dart';

import '../../../../ui/widgets/custom_text/custom_text.dart';

class CheckAccountOtpPage extends StatelessWidget {
  const CheckAccountOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vérification'),
      ),
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            children: const [
              SizedBox(
                height: 50,
              ),
              CustomText(
                text:
                'Renseigner le code que envoyé sur le numéro : ',
                fontSize: 16,
                customTextFontWeight: CustomTextFontWeight.regular,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text:
                '781499206',
                fontSize: 16,
                customTextFontWeight: CustomTextFontWeight.bold,
                textAlign: TextAlign.center,
                color: blueDarkPrimaryColor,
              ),
              SizedBox(
                height: 50,
              ),
              OtpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
