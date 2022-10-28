import 'package:card_oil/constants/size/size.dart';
import 'package:card_oil/data/models/profile_service_model/profile_service_model.dart';
import 'package:card_oil/helpers/list_helpers/list_helpers.dart';
import 'package:flutter/material.dart';

import '../profile_service_item/profile_service_item.dart';

class ProfileScreenList extends StatelessWidget {
  const ProfileScreenList({Key? key, required this.profileServiceList})
      : super(key: key);

  final List<ProfileService> profileServiceList;

  @override
  Widget build(BuildContext context) {
    int indexItem = 0;

    return Padding(
      padding: getPaddingHScreen(context),
      child: Column(
        children: List.generate(getNumberRow(profileServiceList), (index) {
          indexItem++;
          return ProfileServiceItem(
            profileService: profileServiceList[indexItem - 1],
          );
        }),
      ),
    );
  }
}
