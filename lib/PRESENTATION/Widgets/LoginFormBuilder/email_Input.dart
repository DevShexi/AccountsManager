import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/LoginBloc/login_bloc.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;
  final entity;
  const EmailInput({@required this.entity, @required this.emailController});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: entity['padding'],
          child: TextFormField(
            controller: emailController,
            onChanged: (email) =>
                context.read<LoginBloc>().add(EmailChanged(email: email)),
            obscureText: entity['obscureText'],
            // initialValue: "superadmin@admin.com",
            decoration: InputDecoration(
              labelText: entity['decoration']['labelText'],
              // labelStyle: entity['decoration']['labelText'],
              hintText: entity['decoration']['hintText'],
              errorText: state.emailError != null ? state.emailError : null,
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
