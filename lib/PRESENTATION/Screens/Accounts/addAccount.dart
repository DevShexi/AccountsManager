import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/AccountsBloc/accounts_bloc.dart';
import 'package:myShop/PRESENTATION/Widgets/AccountsFormBuilder/addAccount_form.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:myShop/PRESENTATION/Widgets/LoginFormBuilder/login_Form.dart';

class AddAccount extends StatefulWidget {
  final bool flag;
  AddAccount({this.flag});
  @override
  _AddAccountState createState() => _AddAccountState(stateflag: this.flag);
}

class _AddAccountState extends State<AddAccount> {
  final bool stateflag;
  _AddAccountState({this.stateflag});
  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).primaryColor;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
          child: BlocProvider(
        create: (context) => AccountsBloc(),
        child: BlocListener<AccountsBloc, AccountsState>(
          listener: (context, state) async {
            if (state.varified) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString("later", "false");
              Navigator.popAndPushNamed(context, '/mobileAccounts');
            }
          },
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add Account',
                      style: TextStyle(
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    stateflag
                        ? Text(
                            'Lets Begin With Adding an Accoount',
                            style: TextStyle(fontSize: 14),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    AddAccountForm(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: stateflag
                            ? Text(
                                'Ask Me Later',
                                style: TextStyle(fontSize: 14),
                              )
                            : Text('Cancel'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
