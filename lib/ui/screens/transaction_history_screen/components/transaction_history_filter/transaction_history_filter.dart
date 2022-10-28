import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/ui/screens/transaction_history_screen/components/transaction_filter_category_model/transaction_filter_category_modal.dart';
import 'package:card_oil/ui/screens/transaction_history_screen/components/transaction_filter_period_modal/transaction_filter_period_modal.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class TransactionHistoryFilter extends StatelessWidget {
  const TransactionHistoryFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double sizeicon = 9;

    Widget filterButton() {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const TransactionFilterCategoryModal();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0)
            )
          );
        },
        child: Row(
          children: [
            const CustomText(
              text: 'Achat carburant',
              fontSize: 20,
              customTextFontWeight: CustomTextFontWeight.semiBold,
              color: blueDarkPrimaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Image.asset(
                'assets/icons/arrow-down-1.png',
                width: sizeicon,
                height: sizeicon,
              ),
            ),
          ],
        ),
      );
    }

    Widget filterPeriod(){
      return GestureDetector(
        onTap: (){
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const TransactionFilterPeriodModal();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              )
          );
        },
        child: Row(
          children: [
            const CustomText(
              text: 'Tous',
              fontSize: 14,
              customTextFontWeight: CustomTextFontWeight.semiBold,
              color: blueDarkPrimaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Image.asset(
                'assets/icons/arrow-down-2.png',
                width: sizeicon,
                height: sizeicon,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          filterButton(),
          filterPeriod(),
        ],
      ),
    );
  }
}
