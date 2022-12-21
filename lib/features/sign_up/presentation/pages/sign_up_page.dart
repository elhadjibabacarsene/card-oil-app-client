import 'package:card_oil/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:card_oil/features/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/header_sign/header_sign.dart';
import '../../../../helpers/size_config_helpers/size_config_helpers.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            children: const [
              HeaderSign(),
              // form
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
