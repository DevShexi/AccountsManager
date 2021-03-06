import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc()
      : super(AccountsState(
            varified: false,
            accountName: "",
            accountNumber: "",
            ammount: "",
            accountType: "Mobile Account"));

  @override
  Stream<AccountsState> mapEventToState(
    AccountsEvent event,
  ) async* {
    if (event is AccountNameChanged) {
      if (event.accountName.length < 3) {
        yield state.copyWith(
            accountName: event.accountName,
            accountNameError: "Enter a Valid Account Name");
      } else {
        yield state.copyWith(
            accountName: event.accountName, accountNameError: "");
      }
    }
    if (event is AccountTypeChanged) {
      yield state.copyWith(accountType: event.type);
    }
    if (event is AccountNumberChanged) {
      if (state.accountType == "Mobile Account" &&
          event.accountNumber.length < 11) {
        yield state.copyWith(
            accountNumber: event.accountNumber,
            accountNumberError: "Enter 11-Digit Mobile Account Number");
      } else if (state.accountType == "Bank Account" &&
          event.accountNumber.length < 9) {
        yield state.copyWith(
            accountNumber: event.accountNumber,
            accountNumberError: "Enter 9-Digit Bank Account Number");
      } else
        yield state.copyWith(
            accountNumber: event.accountNumber, accountNumberError: "");
    }
    if (event is AmmountChanged) {
      if (double.tryParse(event.ammount) == null) {
        yield state.copyWith(
            ammountError: "Ammount Must be a Non Negative Integer");
      } else if (double.tryParse(event.ammount) >= 0)
        yield state.copyWith(ammount: event.ammount, ammountError: "");
    }
    if (event is AddAccountRequested) {
      yield state.copyWith(varified: true);
    }
    if (event is EmptyFields) {
      yield state.copyWith(
        accountNameError: "Account Name is Required",
        accountNumberError: "Account Numbebr is Required",
      );
    }
    if (event is AccountNameEmpty) {
      yield state.copyWith(
        accountNameError: "Account Name is Required",
      );
    }
    if (event is AccountNumberEmpty) {
      yield state.copyWith(
        accountNumberError: "Account Numbebr is Required",
      );
    }
  }
}
