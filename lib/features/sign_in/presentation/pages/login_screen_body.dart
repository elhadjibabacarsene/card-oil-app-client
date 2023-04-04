import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors/app_colors.dart';
import 'login_screen_form.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // logo
          Padding(
            padding: EdgeInsets.only(top: getH(context) * 0.07, bottom: getH(context) * 0.06),
            child: Image.asset(
              'assets/images/logo-1.png',
              height: getH(context) * 0.07,
            ),
          ),
          // logo title
          CustomText(
            text: 'Card Oil',
            fontSize: getW(context) * 0.08,
            customTextFontWeight: CustomTextFontWeight.bold,
            color: blueDarkPrimaryColor,
          ),
          // description
          Padding(
            padding: EdgeInsets.only(top: getH(context) * 0.003, bottom:  getH(context) * 0.05),
            child: const CustomText(
              text: 'Faire le plein simplement !',
              fontSize: 16,
              customTextFontWeight: CustomTextFontWeight.regular,
              color: greyPrimaryColor,
            ),
          ),
          // Login Form
          const LoginScreenForm(),
        ],
      ),
    );
  }
}
