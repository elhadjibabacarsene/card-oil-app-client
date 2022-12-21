import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors/app_colors.dart';
import '../../../../core/widgets/custom_button/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field/custom_text_form_field.dart';

class LoginScreenForm extends StatefulWidget {
  const LoginScreenForm({Key? key}) : super(key: key);

  @override
  State<LoginScreenForm> createState() => _LoginScreenFormState();
}

class _LoginScreenFormState extends State<LoginScreenForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: getW(context) * 0.07),
          width: getW(context),
          height: getH(context) * 0.1,
          /*child:  CustomTextFormField(
            controller: firstNameController,
            hintText: 'Entrer votre téléphone ou email',
            title: 'Téléphone ou email',
            icon: Icons.phone,
          ),*/
        ),
        Padding(
          padding: EdgeInsets.only(
              top: getW(context) * 0.07, bottom: getH(context) * 0.05),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: getW(context) * 0.07),
            width: getW(context),
            height: getH(context) * 0.1,
            /*child:  CustomTextFormField(
              controller: lastNameController,
              hintText: 'Entrer votre mot de passe',
              title: 'Mot de passe',
              icon: Icons.lock,
            ),*/
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: getH(context) * 0.03),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: getW(context) * 0.07),
            width: getW(context),
            height: getH(context) * 0.08,
            child: const CustomButton(
              title: 'Se connecter',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Pas de compte ? ',
              fontSize: getW(context) * 0.037,
              customTextFontWeight: CustomTextFontWeight.regular,
              color: greyPrimaryColor,
            ),
            CustomText(
              text: 'S\'inscrire',
              fontSize: getW(context) * 0.037,
              customTextFontWeight: CustomTextFontWeight.regular,
              color: menthePrimaryColor,
            ),
          ],
        )
      ],
    );
  }
}
