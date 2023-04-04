import 'package:card_oil/core/helpers/loading_message.dart';
import 'package:card_oil/core/widgets/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/size/size.dart';
import '../../../../core/widgets/custom_text/custom_text.dart';
import '../../../../core/widgets/input_form/input_form.dart';
import '../../../../helpers/size_config_helpers/size_config_helpers.dart';
import '../bloc/sign_up_bloc/sign_up_bloc.dart';

class SignUpPageStep2 extends StatefulWidget {
  const SignUpPageStep2({Key? key}) : super(key: key);

  @override
  State<SignUpPageStep2> createState() => _SignUpPageStep2State();
}

class _SignUpPageStep2State extends State<SignUpPageStep2> {
  final _signUpPageStep4Form = GlobalKey<FormState>();
  final FocusNode _secretCodeFocusNode = FocusNode();
  final FocusNode _secretCodeConfirmFocusNode = FocusNode();

  bool _isSecretCodeEmpty = true;
  bool _isConfirmSecretCodeEmpty = true;

  final TextEditingController _secretCodeController = TextEditingController();
  final TextEditingController _confirmSecretCodeController =
      TextEditingController();

  _buildNameForm() {
    return Form(
      key: _signUpPageStep4Form,
      child: Column(
        children: [
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
                  _isSecretCodeEmpty = false;
                } else {
                  _isSecretCodeEmpty = true;
                }
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          InputForm(
            focusNode: _secretCodeConfirmFocusNode,
            hintText: 'Confirmer Code secret',
            controller: _confirmSecretCodeController,
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
                  _isConfirmSecretCodeEmpty = false;
                } else {
                  _isConfirmSecretCodeEmpty = true;
                }
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switchToNextStep() {
      final SignUpBloc signUpBloc = BlocProvider.of<SignUpBloc>(context);
      if (signUpBloc.state is Step1DataGetIt) {
        Step1DataGetIt state1 = signUpBloc.state as Step1DataGetIt;
        signUpBloc.add(
          GetStep2Data(
            registration: state1.registration.copyWith(
              password: _secretCodeController.text,
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            LoadingMessage.waiting();
          } else {
            LoadingMessage.dismiss();
            if (state is SignUpSuccess) {
              LoadingMessage.info(
                  'Vous êtes inscrit avec succès, veuillez vous connecter',
                  duration: 3);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login_page', (route) => false);
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingScreenW),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Code secret',
                textAlign: TextAlign.left,
                fontSize: 24,
                customTextFontWeight: CustomTextFontWeight.semiBold,
              ),
              const SizedBox(
                height: 4,
              ),
              const CustomText(
                text:
                    'Merci de saisir votre code secret à cinq (5)\nchiffres que vous souhaitez utiliser pour\nvous connecter.',
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
                      title: 'Continuer',
                      onPressed: switchToNextStep,
                      isActive: _isSecretCodeEmpty == false &&
                          _isConfirmSecretCodeEmpty == false),
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
