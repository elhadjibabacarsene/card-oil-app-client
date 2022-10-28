import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/loyalty_box_model/loyalty_box_model.dart';

class LoyaltyBox extends StatelessWidget {
  const LoyaltyBox(
      {Key? key, this.isSelected = false, required this.loyaltyBoxModel})
      : super(key: key);

  final bool isSelected;
  final LoyaltyBoxModel loyaltyBoxModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getW(context) * 0.41,
      height: 104,
      decoration: BoxDecoration(
        color: isSelected == true ? mentheLightColor : greyQuaternaryColor,
        borderRadius: BorderRadius.circular(4.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: '${loyaltyBoxModel.pts} pts',
            fontSize: 20,
            customTextFontWeight: CustomTextFontWeight.semiBold,
            color: isSelected == true ? mentheSecondaryColor : greyTertiaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomText(
              text: '${loyaltyBoxModel.amount} F',
              fontSize: 18,
              customTextFontWeight: CustomTextFontWeight.regular,
              color:  isSelected == true ? menthePrimaryColor : greySecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
