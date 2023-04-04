import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(

      width: 65,
      height: 65,
      textStyle: const TextStyle(
        fontSize: 20,
        color: blueDarkPrimaryColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: greyQuinaryColor,
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
    );
  }
}
