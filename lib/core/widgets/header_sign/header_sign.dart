import 'package:flutter/material.dart';

import '../../../constants/colors/app_colors.dart';
import '../../../ui/widgets/custom_text/custom_text.dart';

class HeaderSign extends StatelessWidget {
  const HeaderSign({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo-1.png',
            width: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: CustomText(
              text: 'Card Oil',
              fontSize: 25,
              customTextFontWeight: CustomTextFontWeight.bold,
              color: blueDarkPrimaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: CustomText(
              text: title,
              fontSize: 16,
              customTextFontWeight: CustomTextFontWeight.regular,
              color: blueDarkPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
