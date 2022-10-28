import 'package:card_oil/constants/size/size.dart';
import 'package:card_oil/data/models/loyalty_box_model/loyalty_box_model.dart';
import 'package:card_oil/helpers/list_helpers/list_helpers.dart';
import 'package:card_oil/ui/screens/loyalty_point/components/loyalty_box/loyalty_box.dart';
import 'package:flutter/material.dart';

class LoyaltyList extends StatelessWidget {
  const LoyaltyList({Key? key, required this.loyaltyList}) : super(key: key);

  final List<LoyaltyBoxModel> loyaltyList;

  @override
  Widget build(BuildContext context) {
    int indexItem = 0;

    return Padding(
      padding: getPaddingHScreen(context),
      child: Column(
          children: List.generate(getNumberRow(loyaltyList), (indexCol) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              2,
              (indexRow) {
                indexItem++;
                return loyaltyList.length > indexItem - 1
                    ? LoyaltyBox(
                        isSelected: indexItem == 1,
                        loyaltyBoxModel: loyaltyList[indexItem - 1])
                    : Container();
              },
            ),
          ),
        );
      })),
    );
  }
}
