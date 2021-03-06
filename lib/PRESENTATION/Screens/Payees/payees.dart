import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/PayeeBloc/payee_bloc.dart';
import 'package:myShop/DATA/payees.dart';
import 'package:myShop/PRESENTATION/Screens/Payees/addPayees.dart';
import 'package:myShop/PRESENTATION/Screens/Transactions/transaction.dart';
import 'package:myShop/PRESENTATION/Widgets/AddPayeesFormBuilder/addPayeesForm.dart';
import 'package:myShop/PRESENTATION/Widgets/TransactionsFormBuilder/TransactionForm.dart';

class Payees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PayeeBloc(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            return showDialog(
              context: context,
              builder: (context) => Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height * (2 / 3),
                  child: AddPayeesForm(),
                ),
              ),
            );
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Payees'),
        ),
        body: BlocListener<PayeeBloc, PayeeState>(
          listener: (context, state) {
            print('Hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
            // if (state is Success) {
            //   Scaffold.of(context).showSnackBar(
            //     SnackBar(
            //       backgroundColor: Colors.green,
            //       content: Text('Payee Added Successfully'),
            //     ),
            //   );
            // }
          },
          child: BlocBuilder<PayeeBloc, PayeeState>(
            builder: (context, state) {
              return SafeArea(
                child: ListView.builder(
                  itemCount: payees.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(payees[index]["name"]),
                        subtitle: Text("Virtual Account"),
                        trailing: Icon(Icons.send, color: Colors.green[800]),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width - 20,
                                height: MediaQuery.of(context).size.height *
                                    (2 / 3),
                                color: Colors.teal,
                                child: TransactionsForm(),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
