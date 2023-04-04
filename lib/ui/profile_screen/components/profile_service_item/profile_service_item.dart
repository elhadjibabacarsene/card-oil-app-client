import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/data/models/profile_service_model/profile_service_model.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServiceItem extends StatelessWidget {
  const ProfileServiceItem({Key? key, required this.profileService})
      : super(key: key);

  final ProfileService profileService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(profileService.title == 'Se déconnecter') {
          Navigator.pushNamedAndRemoveUntil(context, '/login_page', (route) => false);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove('token');

        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    profileService.image,
                    width: 20,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: CustomText(
                      text: profileService.title,
                      fontSize: 20,
                      customTextFontWeight: CustomTextFontWeight.semiBold,
                      color: blueDarkPrimaryColor,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right_outlined,
                size: 30,
                color: greyPrimaryColor,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
