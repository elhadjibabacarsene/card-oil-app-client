import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/core/features/get_details_user/presentation/bloc/get_details_user_bloc.dart';
import 'package:card_oil/data/mocks/profile_servces_mocks/profile_services_mocks.dart';
import 'package:card_oil/ui/profile_screen/components/profile_screen_list/profile_screen_list.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDetailsUserBloc, GetDetailsUserState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  //backgroundImage: AssetImage('assets/images/babs.jpg'),
                  radius: 80,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: CustomText(
                text: state is GetDetailsUserLoaded
                    ? '${state.user.name}'
                    : 'null',
                fontSize: 30,
                customTextFontWeight: CustomTextFontWeight.extraBold,
                color: blueDarkPrimaryColor,
              ),
            ),
            CustomText(
              text: state is GetDetailsUserLoaded
                  ? '${state.user.phoneNumber}'
                  : 'null',
              fontSize: 14,
              customTextFontWeight: CustomTextFontWeight.regular,
              color: blueDarkPrimaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: ProfileScreenList(
                profileServiceList: profileServices,
              ),
            )
          ],
        ),
      );
    });
  }
}
