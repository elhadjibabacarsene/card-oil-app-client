import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/check_option/check_option.dart';

class TransactionFilterCategoryModal extends StatelessWidget {
  const TransactionFilterCategoryModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: CustomText(
              text: 'Type transactions',
              fontSize: 20,
              customTextFontWeight: CustomTextFontWeight.bold,
              color: blueDarkPrimaryColor,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [
                CheckOption(
                  title: 'Achat Essence',
                  status: true,
                ),
                CheckOption(
                  title: 'Achat Gazoil',
                  status: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
