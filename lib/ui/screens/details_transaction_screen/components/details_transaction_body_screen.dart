import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/constants/size/size.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../constants/devices/devices.dart';
import '../../../../data/models/transaction_history_item_model/transaction_history_model.dart';

class DetailsTransactionBodyScreen extends StatelessWidget {
  const DetailsTransactionBodyScreen({Key? key, required this.transaction})
      : super(key: key);

  final TransactionHistoryModel transaction;

  @override
  Widget build(BuildContext context) {
    Widget separator() => const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 16),
          child: Divider(),
        );

    Widget transactionItem(
            {required String title, required String description}) =>
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: title,
                  fontSize: 20,
                  customTextFontWeight: CustomTextFontWeight.bold,
                  color: blueDarkPrimaryColor,
                  textAlign: TextAlign.center,
                ),
                CustomText(
                  text: description,
                  fontSize: 18,
                  customTextFontWeight: CustomTextFontWeight.regular,
                  color: blueDarkPrimaryColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            separator(),
          ],
        );

    return Padding(
      padding: const EdgeInsets.only(top: 46),
      child: Padding(
        padding: getPaddingHScreen(context),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: ' ${transaction.amount} F',
                  fontSize: 30,
                  customTextFontWeight: CustomTextFontWeight.extraBold,
                  color: menthePrimaryColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const CustomText(
              text: 'Achat',
              fontSize: 20,
              customTextFontWeight: CustomTextFontWeight.regular,
              color: greyTertiaryColor,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  transactionItem(
                      title: 'Station', description: 'Total Parcelles'),
                  transactionItem(title: 'Carburant', description: 'Essence'),
                  transactionItem(title: 'Litres', description: '18 Litres'),
                  transactionItem(
                      title: 'Date', description: '30 Oct 2022 à 10h12'),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(
                            text: 'Statut',
                            fontSize: 20,
                            customTextFontWeight: CustomTextFontWeight.bold,
                            color: blueDarkPrimaryColor,
                            textAlign: TextAlign.center,
                          ),
                          CustomText(
                            text: 'Succès',
                            fontSize: 18,
                            customTextFontWeight: CustomTextFontWeight.regular,
                            color: greenPrimaryColor,
                          ),
                        ],
                      ),
                      separator(),
                    ],
                  ),

                  transactionItem(
                      title: 'Code Transaction', description: transaction.code),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
