import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/TransactionBloc/transaction_bloc.dart';
import 'package:myShop/DATA/accounts.dart';

class FromAccountField extends StatefulWidget {
  FromAccountField();

  @override
  _FromAccountFieldState createState() => _FromAccountFieldState();
}

class _FromAccountFieldState extends State<FromAccountField> {
  final List<String> myAccounts = [];

  @override
  void initState() {
    getAccounts();
    super.initState();
  }

  getAccounts() {
    accounts.forEach((element) {
      setState(() {
        myAccounts.add(element['accountName']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
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
                    value: state.fromAccount,
                    isDense: true,
                    onChanged: (String fromAccount) {
                      print(fromAccount);
                      context.read<TransactionBloc>().add(
                            FromAccountChanged(fromAccount: fromAccount),
                          );
                    },
                    items: myAccounts.map((String value) {
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
