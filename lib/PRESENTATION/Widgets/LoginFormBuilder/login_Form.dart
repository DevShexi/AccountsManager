import 'package:flutter/material.dart';
import 'package:myShop/BLOC/LoginBloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/DATA/Models/loginModel.dart';

import 'password_input.dart';
import 'email_input.dart';
import 'submitButton.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
  final LoginBloc _loginBloc = new LoginBloc();
  onDispose() {
    _loginBloc.close();
  }
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              EmailInput(
                  entity: loginModel['email_field'],
                  emailController: emailController),
              PasswordInput(
                entity: loginModel['password_field'],
                passwordController: passwordController,
              ),
              SubmitButton(
                action: loginModel['login_action'],
                formState: formKey.currentState,
                emailValue: emailController,
                passwordValue: passwordController,
              ),
            ],
          ),
        );
      },
    );
  }
}
