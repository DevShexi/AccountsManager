import 'package:flutter/material.dart';
import 'package:myShop/DATA/repository/authRepository.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  AuthenticationRepository authRepo = AuthenticationRepository();
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Accounts',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Wellcome to your all in one accounts manager App',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    child: Text(
                      "Login".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: primaryColor,
                    action: () {
                      Navigator.pushNamed(context, "/login");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     BlocProvider(
              //       create: (context) => AuthBloc(),
              //       child: Button(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             FaIcon(FontAwesomeIcons.google),
              //             SizedBox(
              //               width: 10,
              //             ),
              //             Text(
              //               "Google Login",
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //         color: primaryColor,
              //         action: () async {
              //           String authStatus = await authRepo.googleAuth();
              //           switch (authStatus) {
              //             case "authenticated":
              //               {
              //                 Navigator.popAndPushNamed(context, '/home');
              //               }
              //               break;
              //             default:
              //               {
              //                 Scaffold.of(context).showSnackBar(SnackBar(
              //                   content: Text('Authentication Failed'),
              //                 ));
              //               }
              //           }
              //         },
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function action;
  const Button(
      {@required this.child, @required this.action, @required this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: new FlatButton(
        height: 45,
        child: this.child,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: color,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        onPressed: action,
      ),
    );
  }
}
