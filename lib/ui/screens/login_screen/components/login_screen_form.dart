import 'package:card_oil/constants/size/size.dart';
import 'package:card_oil/core/widgets/input_form/input_form.dart';
import 'package:card_oil/helpers/size_config_helpers/size_config_helpers.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/colors/app_colors.dart';
import '../../../../core/helpers/masktext_input_formater.dart';
import '../../../../core/widgets/custom_button/custom_button.dart';
import '../../../../features/sign_in/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';

class LoginScreenForm extends StatefulWidget {
  const LoginScreenForm({Key? key}) : super(key: key);

  @override
  State<LoginScreenForm> createState() => _LoginScreenFormState();
}

class _LoginScreenFormState extends State<LoginScreenForm> {
  late bool isButtonActive = false;

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _secretCodeController = TextEditingController();
  final FocusNode _secretCodeFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();

  final bool buttonIsDisabled = true;
  bool isPhoneNumberFieldValid = false;
  bool isPasswordFieldValid = false;

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    login() {
      BlocProvider.of<SignInBloc>(context).add(
        SignInWithPhoneNumberAndPwd(
          phoneNumber: _phoneNumberController.text,
          password: _secretCodeController.text,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingScreenW),
      child: Column(
        children: [
          InputForm(
            focusNode: _phoneNumberFocusNode,
            hintText: 'Numéro de téléphone',
            controller: _phoneNumberController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              MaskedTextInputFormatter(
                mask: "XX XXX XX XX",
                separator: ' ',
              ),
            ],
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value != null) {
                if (value.length == 12) {
                  _phoneNumberFocusNode.unfocus();
                } else {
                  isPhoneNumberFieldValid = true;
                }
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          InputForm(
            focusNode: _secretCodeFocusNode,
            hintText: 'Code secret',
            controller: _secretCodeController,
            isSecret: true,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            maxLength: 5,
            onChanged: (value) {
              if (value != null) {
                if (value.length == 5) {
                  _secretCodeFocusNode.unfocus();
                  isPasswordFieldValid = true;
                } else {
                  isPasswordFieldValid = false;
                }
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          /*Container(
            padding: EdgeInsets.symmetric(horizontal: getW(context) * 0.07),
            width: getW(context),
            height: 90,
            child: CustomTextFormField(
              onChanged: (String value) {
                if (value.length > 9) {
                  isButtonActive = true;
                }else{
                  isButtonActive = false;
                }
                setState(() {});
              },
              controller: phoneNumberController,
              hintText: 'Entrer votre numéro de téléphone',
              title: '',
              icon: Icons.phone,
              validators: [],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getW(context) * 0.07),
            width: getW(context),
            height: 90,
            child: CustomTextFormField(
              onChanged: (String value) {
                if (value.length > 5) {
                  isButtonActive = true;
                }else{
                  isButtonActive = false;
                }
                setState(() {});
              },
              controller: secretCodePhoneNumber,
              hintText: 'Entrer votre code secret',
              title: '',
              icon: Icons.lock,
              validators: [],
            ),
          ),
          const SizedBox(height: 30),*/
          SizedBox(
            width: getW(context),
            height: 60,
            child: CustomButton(
              onPressed: login,
              title: 'Se connecter',
              isActive: isPhoneNumberFieldValid == true &&
                      isPasswordFieldValid == true
                  ? true
                  : false,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'Pas de compte ? ',
                fontSize: getW(context) * 0.037,
                customTextFontWeight: CustomTextFontWeight.regular,
                color: greyPrimaryColor,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/sign_up_page_step_1');
                },
                child: CustomText(
                  text: 'S\'inscrire',
                  fontSize: getW(context) * 0.037,
                  customTextFontWeight: CustomTextFontWeight.regular,
                  color: menthePrimaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
