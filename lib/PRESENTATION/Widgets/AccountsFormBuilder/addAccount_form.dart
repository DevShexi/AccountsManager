import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:myShop/BLOC/AccountsBloc/accounts_bloc.dart';
import 'package:myShop/DATA/Models/formFieldsModel.dart';
import 'package:myShop/PRESENTATION/Widgets/AccountsFormBuilder/accountTypeField.dart';
import 'package:myShop/PRESENTATION/Widgets/actionButton.dart';
import 'package:myShop/PRESENTATION/Widgets/inputField.dart';

class AddAccountForm extends StatefulWidget {
  @override
  _AddAccountFormState createState() =>
      _AddAccountFormState(myBloc: _accountsBloc);
  final AccountsBloc _accountsBloc = new AccountsBloc();
  onDispose() {
    _accountsBloc.close();
  }
}

class _AddAccountFormState extends State<AddAccountForm> {
  // final accountNameController = TextEditingController();
  // final accountNumberController = TextEditingController();
  // final ammountController = TextEditingController();
  final AccountsBloc myBloc;
  _AddAccountFormState({@required this.myBloc});

  onSaveAccountActionTriggered(state) {
    if (state.accountName.length == 0 && state.accountNumber.length == 0) {
      context.read<AccountsBloc>().add(EmptyFields());
      print("Fields are Empty");
    } else if (state.accountName.length == 0) {
      context.read<AccountsBloc>().add(AccountNameEmpty());
      print("Account name is Empty");
    } else if (state.accountNumber.length == 0) {
      context.read<AccountsBloc>().add(AccountNumberEmpty());
      print("Account Number is Empty");
    } else if (state.accountNameError == "" && state.accountNumberError == "") {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ),
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context, false);
        Navigator.pop(context, false);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            //    backgroundColor: kLight,
            title: Text(
              'Account Added Successfully',
              style: TextStyle(fontSize: 14),
            ),
          ),
        );
        Future.delayed(
          Duration(seconds: 1),
          () {
            Navigator.pop(context, false);
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsBloc, AccountsState>(
      builder: (context, state) {
        return BlocProvider.value(
          value: myBloc,
          child: BlocBuilder<AccountsBloc, AccountsState>(
            builder: (context, state) {
              return Column(
                children: [
                  AccountTypeField(),
                  InputField(
                      obscure: false,
                      label: "Account Name",
                      hint: state.accountType == "Mobile Account"
                          ? "JazzCash / Easypesa etc"
                          : "Enter Bank Name",
                      entity: formFieldsModel['outlinedInputField'],
                      error: state.accountNameError,
                      changeHandler: (changedValue) {
                        context
                            .read<AccountsBloc>()
                            .add(AccountNameChanged(accountName: changedValue));
                      }),
                  InputField(
                    obscure: false,
                    label: "Account Number",
                    hint: state.accountType == "Mobile Account"
                        ? "03 ** *******"
                        : "9-Digit Bank Number",
                    entity: formFieldsModel['outlinedInputField'],
                    error: state.accountNumberError,
                    changeHandler: (changedValue) {
                      context.read<AccountsBloc>().add(
                          AccountNumberChanged(accountNumber: changedValue));
                    },
                  ),
                  ActionButton(
                    actionModel: formFieldsModel['actionButton'],
                    name: "Save Account",
                    action: () {
                      if (state.accountName.length == 0 &&
                          state.accountNumber.length == 0) {
                        context.read<AccountsBloc>().add(EmptyFields());
                        print("Fields are Empty");
                      } else if (state.accountName.length == 0) {
                        context.read<AccountsBloc>().add(AccountNameEmpty());
                        print("Account name is Empty");
                      } else if (state.accountNumber.length == 0) {
                        context.read<AccountsBloc>().add(AccountNumberEmpty());
                        print("Account Number is Empty");
                      } else if (state.accountNameError == "" &&
                          state.accountNumberError == "") {
                        showDialog(
                          context: context,
                          builder: (context) => Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                        Future.delayed(
                          Duration(seconds: 2),
                          () {
                            Navigator.pop(context, false);
                            Navigator.pop(context, false);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                //    backgroundColor: kLight,
                                title: Text(
                                  'Account Added Successfully',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            );
                            Future.delayed(
                              Duration(seconds: 1),
                              () {
                                Navigator.pop(context, false);
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
        );
        // Column(
        //   children: [
        //     AccountTypeField(),
        //     state.accountType != "Cash In Hand"
        //         ? Column(
        //             children: [
        //               AccountnameField(
        //                   entity: accountsModel['accountName_field'],
        //                   accountNameController: accountNameController),
        //               AccountNumberField(
        //                 entity: accountsModel['accountNumber_field'],
        //                 accountNumberController: accountNumberController,
        //               ),
        //             ],
        //           )
        //         : SizedBox(),
        //     // AmmountInput(
        //     //   entity: accountsModel['ammount_field'],
        //     //   ammountController: ammountController,
        //     // ),
        //     AddAccountButton(
        //       action: accountsModel['accounts_action'],
        //       accountNameController: accountNameController,
        //       accountNumberController: accountNumberController,
        //       ammountController: ammountController,
        //     ),
        //   ],
        // );
      },
    );
  }
}
