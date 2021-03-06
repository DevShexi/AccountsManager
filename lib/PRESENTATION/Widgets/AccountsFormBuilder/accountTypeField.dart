import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/AccountsBloc/accounts_bloc.dart';

class AccountTypeField extends StatelessWidget {
  final List<String> _accountTypes = [
    "Mobile Account",
    "Bank Account"
  ];
  final entity;
  AccountTypeField({this.entity});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsBloc, AccountsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: FormField<String>(
            builder: (FormFieldState<String> formState) {
              return InputDecorator(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  // labelStyle: textStyle,
                  errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  hintText: 'Select an Account Type',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[800]),
                    // borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                isEmpty: false,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: state.accountType,
                    isDense: true,
                    onChanged: (String newValue) {
                      print(newValue);
                      context.read<AccountsBloc>().add(
                            AccountTypeChanged(type: newValue),
                          );
                    },
                    items: _accountTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
