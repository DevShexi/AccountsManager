import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/LoginBloc/login_bloc.dart';

class SubmitButton extends StatelessWidget {
  final TextEditingController emailValue;
  final TextEditingController passwordValue;
  final action;
  final FormState formState;
  const SubmitButton({
    @required this.action,
    @required this.formState,
    @required this.emailValue,
    @required this.passwordValue,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: action['padding'],
          child: SizedBox(
            width: action['width'],
            height: action['height'],
            child: RaisedButton(
              color: action['raisedButton']['color'],
              child: Text('${action['raisedButton']['name']}',
                  style: action['raisedButton']['titleStyle']),
              onPressed: () {
                print(passwordValue.text + passwordValue.text);
                if (emailValue.text != "" && passwordValue.text != "") {
                  emailValue.clear();
                  passwordValue.clear();
                  // print("'-._Empty_.-''-._Empty_.-''-._Empty_.-''-._Empty_.-'");
                  print("'-.Done.-''-.Done.-''-.Done.-''-.Done.-'");
                  context.read<LoginBloc>().add(AttemptLogin(
                      email: state.email, password: state.password));
                  return true;
                } else {
                  context
                      .read<LoginBloc>()
                      .add(AttemptLogin(email: null, password: null));
                }
              },
            ),
          ),
        );
      },
    );
  }
}
