
import 'package:flutter/material.dart';

import '../../../../../constants/colors/app_colors.dart';
import '../../../../../core/widgets/check_option/check_option.dart';
import '../../../../../core/widgets/custom_text/custom_text.dart';

class TransactionFilterPeriodModal extends StatelessWidget {
  const TransactionFilterPeriodModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: CustomText(
              text: 'Période',
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
                  title: 'Tous',
                  status: true,
                ),
                CheckOption(
                  title: 'Aujourd\'hui',
                  status: false,
                ),
                CheckOption(
                  title: 'Cette semaine',
                  status: false,
                ),
                CheckOption(
                  title: 'Ce mois',
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
