import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/LoginBloc/login_bloc.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController passwordController;
  final entity;
  const PasswordInput(
      {@required this.entity, @required this.passwordController});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: entity['padding'],
          child: TextFormField(
            controller: passwordController,
            onChanged: (password) => context
                .read<LoginBloc>()
                .add(PasswordChanged(password: password)),
            obscureText: entity['obscureText'],
            // initialValue: "Qservproject123",
            decoration: InputDecoration(
              labelText: entity['decoration']['labelText'],
              // labelStyle: entity['decoration']['labelText'],
              hintText: entity['decoration']['hintText'],
              errorText:
                  state.passwordError != null ? state.passwordError : null,
              // hintStyle: entity['decoration']['hintStyle'],
              enabledBorder: entity['decoration']['enabledBorder'],
              focusedBorder: entity['decoration']['focusedBorder'],
              errorBorder: entity['decoration']['errorBorder'],
              focusedErrorBorder: entity['decoration']['focusedErrorBorder'],
            ),
            //validators: entity['validators'],
          ),
        );
      },
    );
  }
}
