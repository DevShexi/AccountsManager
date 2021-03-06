import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc()
      : super(TransactionState(ammount: '', fromAccount: 'Inhand Cash'));

  @override
  Stream<TransactionState> mapEventToState(
    TransactionEvent event,
  ) async* {
    if (event is TransactionAmmountChanged) {
      yield state.copyWith(ammount: event.transactionAmmount, ammountError: "");
    }
    if (event is TransactionCommentsChanged) {
      yield state.copyWith(comments: event.comments);
    }
    if (event is FromAccountChanged) {
      yield state.copyWith(fromAccount: event.fromAccount);
    }
    if (event is InvalidAmmount) {
      print('InvalidAmmount Event Called');
      yield state.copyWith(ammountError: "Please Enter a Valid Ammount");
    }
  }
}
