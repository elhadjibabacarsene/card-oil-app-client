import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/constants/size/size.dart';
import 'package:card_oil/features/transaction_history/domain/entities/Transaction.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/helpers/amount_helper.dart';
import '../../../../../../core/helpers/date_helper.dart';
import '../../../../../../single_app.dart';

class DetailsTransactionBodyScreen extends StatelessWidget {
  const DetailsTransactionBodyScreen({Key? key, required this.transaction})
      : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
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
                  text:
                      '${transaction.amount != null ? sl<AmountHelper>().formatAmount(transaction.amount!) : ''} FCFA',
                  fontSize: 30,
                  customTextFontWeight: CustomTextFontWeight.extraBold,
                  color: menthePrimaryColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            CustomText(
              text: transaction.typeTransaction?.libelle ?? '',
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
                      title: 'Station', description: '${transaction.station}'),
                  transaction.product != null
                      ? transactionItem(
                          title: 'Produit',
                          description: '${transaction.product?.libelle}')
                      : Container(),
                  transaction.quantity != null
                      ? transactionItem(
                          title: 'Quantité',
                          description: '${transaction.quantity}')
                      : Container(),
                  transactionItem(
                    title: 'Date',
                    description: sl<DateHelper>()
                        .formatDateForHumanReadable(transaction.createdAt.toString()),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: 'Statut',
                            fontSize: 20,
                            customTextFontWeight: CustomTextFontWeight.bold,
                            color: blueDarkPrimaryColor,
                            textAlign: TextAlign.center,
                          ),
                          CustomText(
                            text: getStatusTransaction() ?? '',
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
                      title: 'Code Transaction',
                      description: '${transaction.idTransaction}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
