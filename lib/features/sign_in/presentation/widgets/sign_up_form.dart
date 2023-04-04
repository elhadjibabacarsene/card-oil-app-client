import 'package:card_oil/single_app.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field/custom_text_form_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              height: 120,
              child: CustomTextFormField(
                hintText: 'Entrer votre prénom',
                title: 'Prénom',
                icon: Icons.person_rounded,
                controller: firstNameController,
                validators: const [Validator.required],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              height: 120,
              child: CustomTextFormField(
                hintText: 'Entrer votre nom',
                title: 'Nom',
                icon: Icons.person_rounded,
                controller: lastNameController,
                validators: const [Validator.required],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              height: 120,
              child: CustomTextFormField(
                hintText: 'Entrer numéro de téléphone',
                title: 'Téléphone',
                icon: Icons.phone,
                controller: phoneNumberController,
                validators: const [Validator.required, Validator.phoneNumber],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 72,
            child: CustomButton(
              title: 'S\'inscrire',
              onPressed: () {
              },
            ),
          ),
        ],
      ),
    );
  }
}
