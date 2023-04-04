import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../../../core/widgets/loading_message/loading_message.dart';

class CheckAccountForm extends StatefulWidget {
  const CheckAccountForm({Key? key}) : super(key: key);

  @override
  State<CheckAccountForm> createState() => _CheckAccountFormState();
}

class _CheckAccountFormState extends State<CheckAccountForm> {
  final TextEditingController _phoneNumberController = TextEditingController();


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
                hintText: 'Entrer votre téléphone',
                title: '',
                icon: Icons.phone,
                controller: _phoneNumberController,
                validators: const [Validator.required],
              ),
            ),
          ),

          ///const Spacer(),
          SizedBox(
            height: 72,
            child: CustomButton(
              title: 'Suivant',
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}
