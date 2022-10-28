import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors/app_colors.dart';
import '../../../../../constants/size/size.dart';

class HomePageScreenAppBar extends StatelessWidget {
  const HomePageScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPaddingHScreen(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/profile_screen');
            },
            child: Image.asset(
              'assets/icons/menu-home.png',
              width: getW(context) * 0.08,
            ),
          ),
          CustomText(
            text: 'Card Oil',
            fontSize: getW(context) * 0.05,
            customTextFontWeight: CustomTextFontWeight.bold,
            color: blueDarkPrimaryColor,
          ),
          const Icon(
            Icons.qr_code_scanner_outlined,
            color: greyPrimaryColor,
            size: 25,
          ),
        ],
      ),
    );
  }
}
