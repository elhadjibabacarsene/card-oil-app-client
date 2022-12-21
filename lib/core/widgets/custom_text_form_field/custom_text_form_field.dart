import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors/app_colors.dart';

enum Validator { required, phoneNumber }

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.title,
    this.icon,
    this.hintText,
    required this.controller,
    required this.validators,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final String? hintText;
  final TextEditingController controller;
  final List<Validator> validators;

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
            controller: controller,
            validator: (value) {
              // Required checked
              for (var validator in validators) {
                if (validator == Validator.required) {
                  if (controller.text == '') {
                    return 'Ce champs est obligatoire';
                  }
                }
                // PhoneNumber checked
                if (validator == Validator.phoneNumber) {
                  if (value!.isEmpty ||
                      !RegExp(r'(^(221|00221|\+221)?(77|78|75|70|76)[0-9]{7}$)')
                          .hasMatch(value)) {
                    return " Ce Numéro est invalide!";
                  }
                }
              }

              return null;
            },
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: blueDarkPrimaryColor,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: greyTertiaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: icon != null
                  ? Icon(
                      icon,
                      color: greyTertiaryColor,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
