import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/TransactionBloc/transaction_bloc.dart';
import 'package:myShop/PRESENTATION/Widgets/TransactionsFormBuilder/TransactionForm.dart';

class Transaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Container(
            child: BlocProvider.value(
                value: BlocProvider.of<TransactionBloc>(context),
                child: TransactionsForm()),
          ),
        ),
      ),
    );
  }
}
