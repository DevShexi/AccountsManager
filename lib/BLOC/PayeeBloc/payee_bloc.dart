import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'payee_event.dart';
part 'payee_state.dart';

class PayeeBloc extends Bloc<PayeeEvent, PayeeState> {
  PayeeBloc()
      : super(
          PayeeState(name: "", account: ""),
        );

  @override
  Stream<PayeeState> mapEventToState(
    PayeeEvent event,
  ) async* {
    yield Success();
    if (event is PayeeNameChanged) {
      yield event.name.length > 0
          ? state.copyWith(name: event.name, nameError: "")
          : state.copyWith(
              name: event.name, nameError: 'Payee Name is Required');
      print(state.name);
      print('Calling PayeeNameChange');
    }
    if (event is PayeeAccountChanged) {
      if (event.accountName != null || event.accountName != "") {
        yield state.copyWith(account: event.accountName);
      }
    }
    if (event is IsVirtualToggled) {
      yield (state.copyWith(virtual: event.isVirtual));
    }
    if (event is InvalidName) {
      yield state.copyWith(nameError: 'Enter a Valid Payee Name');
      print('calling InvalidName');
    }
    if (event is NewPayeeAdded) {
      yield Loading();
      print('Loading State Yielded');
      Future.delayed(Duration(seconds: 2));
      yield Success();
      print('Success State Yielded');
    }
    if (event is AddingPayee) {
      yield Loading();
      print('Notified Event Was Called');
    }
  }
}
