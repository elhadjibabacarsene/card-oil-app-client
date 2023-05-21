import 'package:card_oil/ui/screens/login_screen/components/login_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/user_details_bloc/user_details_bloc.dart';
import '../../../core/features/get_details_user/presentation/bloc/get_details_user_bloc.dart';
import '../../../core/helpers/loading_message.dart';
import '../../../features/sign_in/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import '../../../single_app.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInLoading) {
            LoadingMessage.waiting();
          } else {
            LoadingMessage.dismiss();
          }
          if (state is SignInSuccess) {
            BlocProvider.of<GetDetailsUserBloc>(context).add(ToGetDetailsUser());
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
            // LoadingMessage.info('success');
          }
          if (state is SignInFailure) {
            LoadingMessage.error(state.message);
          }
        },
        child: const LoginScreenBody(),
      )),
    );
  }
}
