import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/core/helpers/date_helper.dart';
import 'package:card_oil/features/transaction_history/data/models/transaction_model.dart';
import 'package:card_oil/features/transaction_history/domain/entities/Transaction.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/amount_helper.dart';
import '../../../../../single_app.dart';

class TransactionItemHistory extends StatelessWidget {
  const TransactionItemHistory({Key? key, required this.transaction})
      : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    getStatusColor() {
      switch (transaction.status) {
        case 'success':
          return greenPrimaryColor;
        case 'failed':
          return redPrimaryColor;
        case 'TP':
          return yellowDarkColor;
        case 'TC':
          return redPrimaryColor;
      }
    }

    getStatusTransaction() {
      switch (transaction.status) {
        case 'success':
          return 'Succès';
        case 'failed':
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
              text:
                  '${transaction.transactionType?.name} chez ${transaction.station?.name}',
              fontSize: 14,
              customTextFontWeight: CustomTextFontWeight.semiBold,
              color: blueDarkPrimaryColor,
            ),
            CustomText(
              text: sl<DateHelper>()
                  .formatDateToDDMMYYYYHHMM(transaction.createdAt.toString()),
              fontSize: 12,
              customTextFontWeight: CustomTextFontWeight.regular,
              color: greyPrimaryColor,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 9.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  transaction.quantity != null ? CustomText(
                    text: '${transaction.quantity} - ',
                    fontSize: 14,
                    customTextFontWeight: CustomTextFontWeight.regular,
                    color: greyPrimaryColor,
                  ) : Container(),
                  CustomText(
                    text:
                        '${transaction.amount != null ? sl<AmountHelper>().formatAmount(int.parse(transaction.amount!.replaceAll('.', ''))) : ''} FCFA',
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
