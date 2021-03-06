import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/PayeeBloc/payee_bloc.dart';
import 'package:myShop/PRESENTATION/Widgets/AddPayeesFormBuilder/addPayeesForm.dart';

class AddPayee extends StatefulWidget {
  @override
  _AddPayeeState createState() => _AddPayeeState();
}

class _AddPayeeState extends State<AddPayee> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PayeeBloc(),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add Payee',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 20,
                    ),
                    BlocProvider.value(
                      value: BlocProvider.of<PayeeBloc>(context),
                      child: AddPayeesForm(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
