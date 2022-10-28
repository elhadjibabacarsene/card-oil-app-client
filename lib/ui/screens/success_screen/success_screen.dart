import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/colors/app_colors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: menthePrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/pay_anim.json'),
            const CustomText(
              text: 'Merci pour votre fidélité !',
              fontSize: 30,
              customTextFontWeight: CustomTextFontWeight.bold,
              color: whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
