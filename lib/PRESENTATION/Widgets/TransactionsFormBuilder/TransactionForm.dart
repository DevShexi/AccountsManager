import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/TransactionBloc/transaction_bloc.dart';
import 'package:myShop/DATA/Models/formFieldsModel.dart';
import 'package:myShop/PRESENTATION/Widgets/actionButton.dart';
import 'package:myShop/PRESENTATION/Widgets/TransactionsFormBuilder/fromAccountField.dart';
import 'package:myShop/PRESENTATION/Widgets/inputField.dart';

class TransactionsForm extends StatefulWidget {
  @override
  _TransactionsFormState createState() => _TransactionsFormState();
}

class _TransactionsFormState extends State<TransactionsForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Transfer Money",
                      style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 16),
                        child: Text('Chose an Account'),
                      ),
                    ],
                  ),
                  BlocBuilder<TransactionBloc, TransactionState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          BlocProvider.value(
                              value: BlocProvider.of<TransactionBloc>(context),
                              child: FromAccountField()),
                          BlocProvider.value(
                            value: BlocProvider.of<TransactionBloc>(context),
                            child: InputField(
                                keyType: TextInputType.numberWithOptions(),
                                obscure: false,
                                label: "Ammount",
                                hint: "Enter Ammount",
                                entity: formFieldsModel['outlinedInputField'],
                                error: state.ammountError,
                                changeHandler: (changedValue) {
                                  context.read<TransactionBloc>().add(
                                      TransactionAmmountChanged(
                                          transactionAmmount: changedValue));
                                }),
                          ),
                          BlocProvider.value(
                            value: BlocProvider.of<TransactionBloc>(context),
                            child: InputField(
                                obscure: false,
                                label: "Comments",
                                hint: "Comments (Optional)",
                                entity: formFieldsModel['outlinedInputField'],
                                changeHandler: (changedValue) {
                                  context.read<TransactionBloc>().add(
                                        TransactionCommentsChanged(
                                            comments: changedValue),
                                      );
                                }),
                          ),
                          BlocProvider.value(
                            value: BlocProvider.of<TransactionBloc>(context),
                            child: ActionButton(
                                actionModel: formFieldsModel['actionButton'],
                                name: "Transfer Money",
                                action: () {
                                  if (state.ammount.length == 0) {
                                    context
                                        .read<TransactionBloc>()
                                        .add(InvalidAmmount());
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Center(
                                        child: Container(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    );
                                    // Navigator.pop(context, false);
                                    // Navigator.pop(context, false);
                                    // Scaffold.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     content: Text('Transaction Successful'),
                                    //   ),
                                    // );
                                    Future.delayed(
                                      Duration(seconds: 1),
                                      () {
                                        // Navigator.pop(context, false);
                                        Navigator.pop(context, false);
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.green[700],
                                            duration:
                                                Duration(milliseconds: 1500),
                                            content:
                                                Text("Transaction Successful"),
                                          ),
                                        );
                                        Future.delayed(Duration(seconds: 2),
                                            () {
                                          Navigator.pop(context, false);
                                        });
                                      },
                                    );
                                  }
                                }),
                          ),
                        ],
                      );
                    },
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
