import 'package:card_oil/core/widgets/loading_message/loading_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/header_sign/header_sign.dart';
import '../../../../single_app.dart';
import '../widgets/check_account_form.dart';

class CheckAccountPage extends StatelessWidget {
  const CheckAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            children: const [
              HeaderSign(
                title: 'Renseigner votre numéro de téléphone',
              ),
              CheckAccountForm(),
            ],
          ),
        ),
      ),
    );
  }
}
