import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.title, this.icon, this.hintText})
      : super(key: key);

  final String title;
  final IconData? icon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: getH(context) * 0.008),
            child: CustomText(
              text: title,
              fontSize: 16,
              customTextFontWeight: CustomTextFontWeight.regular,
              color: greyTertiaryColor,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: greyTertiaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: icon != null
                  ? Icon(icon, color: greyTertiaryColor,)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
