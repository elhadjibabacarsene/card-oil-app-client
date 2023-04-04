import 'package:card_oil/core/widgets/custom_button/custom_button.dart';
import 'package:card_oil/core/widgets/custom_text/custom_text.dart';
import 'package:card_oil/features/sign_up/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/size/size.dart';
import '../../../../core/helpers/masktext_input_formater.dart';
import '../../../../core/widgets/input_form/input_form.dart';
import '../../../../helpers/size_config_helpers/size_config_helpers.dart';
import '../../domain/entities/registration.dart';

class SignUpPageStep1 extends StatefulWidget {
  const SignUpPageStep1({Key? key}) : super(key: key);

  @override
  State<SignUpPageStep1> createState() => _SignUpPageStep1State();
}

class _SignUpPageStep1State extends State<SignUpPageStep1> {
  bool _isFirstNameEmpty = true;
  bool _isLastNameEmpty = true;

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final FocusNode _phoneNumberFocusNode = FocusNode();

  final bool buttonIsDisabled = true;
  bool isPhoneNumberFieldValid = false;

  _buildNameForm() {
    return Form(
      child: Column(
        children: [
          InputForm(
            focusNode: _phoneNumberFocusNode,
            hintText: 'Numéro téléphone',
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
            height: 16,
          ),
          InputForm(
            controller: _firstNameController,
            hintText: 'Prénom(s)',
            onChanged: (value) {
              if (value != null) {
                if (value.isNotEmpty) {
                  _isFirstNameEmpty = false;
                } else {
                  _isFirstNameEmpty = true;
                }
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          InputForm(
            controller: _lastNameController,
            hintText: 'Nom',
            onChanged: (value) {
              if (value != null) {
                if (value.isNotEmpty) {
                  _isLastNameEmpty = false;
                } else {
                  _isLastNameEmpty = true;
                }
                setState(() {});
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switchToNextStep() {
      final Registration registration = Registration(
        phonenumber: _phoneNumberController.text,
        firstname: _firstNameController.text,
        lastname: _lastNameController.text,
      );
      BlocProvider.of<SignUpBloc>(context)
          .add(GetStep1Data(registration: registration));
    }

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is Step1DataGetIt) {
            Navigator.pushNamed(context, '/sign_up_page_step_2');
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingScreenW),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Informations personnelles',
                textAlign: TextAlign.left,
                fontSize: 24,
                customTextFontWeight: CustomTextFontWeight.semiBold,
              ),
              const SizedBox(
                height: 4,
              ),
              const CustomText(
                text:
                    'Veuillez renseigner votre numéro de téléphone, votre nom et votre prénom pour pouvoir utiliser notre application.',
                textAlign: TextAlign.left,
                fontSize: 16,
                customTextFontWeight: CustomTextFontWeight.regular,
              ),
              const Spacer(
                flex: 3,
              ),
              _buildNameForm(),
              const Spacer(
                flex: 5,
              ),
              SafeArea(
                child: SizedBox(
                  width: getW(context),
                  height: 60,
                  child: CustomButton(
                    onPressed: () {
                      switchToNextStep();
                    },
                    title: 'Continuer',
                    isActive: _isFirstNameEmpty == true ||
                            _isLastNameEmpty == true ||
                            isPhoneNumberFieldValid == false
                        ? false
                        : true,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
