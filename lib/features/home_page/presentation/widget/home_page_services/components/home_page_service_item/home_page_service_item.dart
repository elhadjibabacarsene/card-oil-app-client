import 'package:card_oil/data/models/home_service_item_model/home_service_item_model.dart';
import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../constants/colors/app_colors.dart';

class HomePageServiceItem extends StatelessWidget {
  const HomePageServiceItem({Key? key, required this.homeServiceItemModel})
      : super(key: key);

  final HomeServiceItemModel homeServiceItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, homeServiceItemModel.link);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        width: getW(context)*0.4,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: greyQuaternaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              homeServiceItemModel.image,
              width: 35,
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
              child: CustomText(
                text: homeServiceItemModel.title,
                fontSize: 18.5,
                customTextFontWeight: CustomTextFontWeight.extraBold,
                color: blueDarkPrimaryColor,
              ),
            ),/*
            CustomText(
              text: homeServiceItemModel.description,
              fontSize: 14,
              customTextFontWeight: CustomTextFontWeight.regular,
              color: greyPrimaryColor,
            ),*/
          ],
        ),
      ),
    );
  }
}
