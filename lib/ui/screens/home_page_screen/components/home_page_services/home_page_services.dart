import 'package:flutter/material.dart';

import '../../../../../data/models/home_service_item_model/home_service_item_model.dart';
import 'components/home_page_service_item/home_page_service_item.dart';

class HomePageServices extends StatelessWidget {
  const HomePageServices({Key? key, required this.homeServicesList})
      : super(key: key);

  final List<HomeServiceItemModel> homeServicesList;

  @override
  Widget build(BuildContext context) {
    int indexService = 0;
    int getNumberRow() {
      return homeServicesList.length.ceil();
    }

    return Column(
      children: List.generate(getNumberRow(), (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              2,
              (index2) {
                indexService++;
                return homeServicesList.length > indexService-1 ? HomePageServiceItem(
                  homeServiceItemModel: homeServicesList[indexService - 1],
                ) : Container();
              },
            ),
          ),
        );
      }),
    );
  }
}
