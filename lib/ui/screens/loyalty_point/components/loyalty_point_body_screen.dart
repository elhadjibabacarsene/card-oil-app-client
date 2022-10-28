import 'package:card_oil/constants/size/size.dart';
import 'package:card_oil/data/mocks/loyalty_box_mocks/loyalty_box_mocks.dart';
import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:card_oil/ui/widgets/custom_button/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors/app_colors.dart';
import '../../../widgets/custom_text/custom_text.dart';
import 'loyalty_list/loyalty_list.dart';

class LoyaltyPointBodyScreen extends StatelessWidget {
  const LoyaltyPointBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: getPaddingHScreen(context),
          child: Container(
            width: getW(context),
            height: 120,
            decoration: BoxDecoration(
                color: greyQuinaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CustomText(
                  text: '50 000 pts',
                  fontSize: 30,
                  customTextFontWeight: CustomTextFontWeight.extraBold,
                  color: menthePrimaryColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 50.0, bottom: 10),
          child: CustomText(
            text: 'Convertissez vos points en : ',
            fontSize: 18,
            customTextFontWeight: CustomTextFontWeight.regular,
            color: greyTertiaryColor,
          ),
        ),
        const Divider(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: LoyaltyList(
                loyaltyList: loyaltyBoxMocks,
              ),
            ),
            Padding(
              padding: getPaddingHScreen(context),
              child: SizedBox(
                height: 50,
                child: CustomButton(
                  title: 'Valider',
                  onPressed: () {
                    Navigator.pushNamed(context, '/success_screen');
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
