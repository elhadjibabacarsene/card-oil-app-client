import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors/app_colors.dart';

class BalanceHomePage extends StatelessWidget {
  const BalanceHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset('assets/images/balance.png'),
        Padding(
          padding:  EdgeInsets.only(bottom: getH(context)*0.025),
          child: Column(
            children:  [
              Padding(
                padding:  EdgeInsets.only(bottom: getH(context)*0.007),
                child: const CustomText(
                  text: 'Solde actuel',
                  fontSize: 16,
                  customTextFontWeight: CustomTextFontWeight.regular,
                  color: menthePrimaryColor,
                ),
              ),
              CustomText(
                text: '10 000F',
                fontSize: getW(context)*0.065,
                customTextFontWeight: CustomTextFontWeight.extraBold,
                color: mentheSecondaryColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}
