import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/transaction_history_item_model/transaction_history_model.dart';

class TransactionItemHistory extends StatelessWidget {
  const TransactionItemHistory({Key? key, required this.transaction})
      : super(key: key);

  final TransactionHistoryModel transaction;

  @override
  Widget build(BuildContext context) {
    getStatusColor() {
      switch (transaction.status) {
        case 'TS':
          return greenPrimaryColor;
        case 'TF':
          return redPrimaryColor;
        case 'TP':
          return yellowDarkColor;
        case 'TC':
          return redPrimaryColor;
      }
    }

    getStatusTransaction() {
      switch (transaction.status) {
        case 'TS':
          return 'Succès';
        case 'TF':
          return 'Echoué';
        case 'TP':
          return 'En cours';
        case 'TC':
          return 'Annuler';
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: transaction.title,
              fontSize: 14,
              customTextFontWeight: CustomTextFontWeight.semiBold,
              color: blueDarkPrimaryColor,
            ),
            CustomText(
              text: transaction.date,
              fontSize: 12,
              customTextFontWeight: CustomTextFontWeight.regular,
              color: greyPrimaryColor,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top:9.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomText(
                    text: '${transaction.quantity} - ',
                    fontSize: 14,
                    customTextFontWeight: CustomTextFontWeight.regular,
                    color: greyPrimaryColor,
                  ),
                  CustomText(
                    text: '${transaction.amount} FCFA',
                    fontSize: 14,
                    customTextFontWeight: CustomTextFontWeight.bold,
                    color: blueDarkPrimaryColor,
                  ),
                ],
              ),
              CustomText(
                text: getStatusTransaction()!,
                fontSize: 12,
                customTextFontWeight: CustomTextFontWeight.regular,
                color: getStatusColor(),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 11.0),
          child: Divider(),
        ),
      ],
    );
  }
}
