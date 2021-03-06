import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/LoginBloc/login_bloc.dart';
import 'package:myShop/PRESENTATION/Widgets/LoginFormBuilder/login_Form.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool inprogress = false;
  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).primaryColor;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginBloc(),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pushReplacementNamed(context, "/home");
                setState(() {
                  inprogress = false;
                });
              }
              if (state is LoginFailed) {
                setState(() {
                  inprogress = false;
                });
              }
            },
            child: inprogress
                ? Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('Please Login to your Account'),
                        SizedBox(
                          height: 50,
                        ),
                        LoginForm(),
                        InkWell(
                          onTap: () {
                            Navigator.popAndPushNamed(context, '/home');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'SKIP',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
