import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myShop/BLOC/PayeeBloc/payee_bloc.dart';
import 'package:myShop/DATA/Models/formFieldsModel.dart';
import 'package:myShop/PRESENTATION/Widgets/actionButton.dart';
import 'package:myShop/PRESENTATION/Widgets/inputField.dart';

class AddPayeesForm extends StatefulWidget {
  @override
  _AddPayeesFormState createState() => _AddPayeesFormState();
}

class _AddPayeesFormState extends State<AddPayeesForm> {
  bool isVirtual = false;
  _AddPayeesFormState();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PayeeBloc(),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: BlocBuilder<PayeeBloc, PayeeState>(
          builder: (context, state) {
            return Container(
              child: Column(
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
                  SizedBox(
                    height: 36,
                  ),
                  BlocProvider.value(
                    value: BlocProvider.of<PayeeBloc>(context),
                    child: InputField(
                      obscure: false,
                      label: "Name",
                      hint: "Payee Name",
                      entity: formFieldsModel['outlinedInputField'],
                      error: state.nameError,
                      changeHandler: (changedValue) {
                        context
                            .read<PayeeBloc>()
                            .add(PayeeNameChanged(name: changedValue));
                      },
                    ),
                  ),
                  BlocProvider.value(
                    value: BlocProvider.of<PayeeBloc>(context),
                    child: CheckboxListTile(
                      title: Text("is virtual"),
                      value: isVirtual,
                      onChanged: (newValue) {
                        setState(() {
                          isVirtual = newValue;
                        });
                        context.read<PayeeBloc>().add(
                              IsVirtualToggled(isVirtual: isVirtual),
                            );
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                  ),
                  BlocProvider.value(
                    value: BlocProvider.of<PayeeBloc>(context),
                    child: ActionButton(
                      actionModel: formFieldsModel['actionButton'],
                      name: "Add Payee",
                      action: () {
                        if (state.name != null && state.name != "") {
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
                              Navigator.pop(context, false);
                              context.read<PayeeBloc>().add(NewPayeeAdded());
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.green[700],
                                  duration: Duration(milliseconds: 1500),
                                  content: Text("Transaction Successful"),
                                ),
                              );
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.pop(context, false);
                              });
                            },
                          );

                          context.read<PayeeBloc>().add(NewPayeeAdded());
                        } else
                          context.read<PayeeBloc>().add(InvalidName());
                      },
                    ),
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
            );
          },
        ),
      ),
    );
  }
}
