part of 'accounts_bloc.dart';

abstract class AccountsEvent extends Equatable {
  const AccountsEvent();

  @override
  List<Object> get props => [];
}

class AccountNameChanged extends AccountsEvent {
  final String accountName;
  AccountNameChanged({
    @required this.accountName,
  }) : assert(accountName != null, "Account Name is Null");
  List<Object> get props => [accountName];
}

class AccountNumberChanged extends AccountsEvent {
  final String accountNumber;
  AccountNumberChanged({
    @required this.accountNumber,
  }) : assert(accountNumber != null, "Account Number is Null");
  List<Object> get props => [accountNumber];
}

class AmmountChanged extends AccountsEvent {
  final String ammount;
  AmmountChanged({
    @required this.ammount,
  }) : assert(ammount != null, "Ammount is Null");
  List<Object> get props => [ammount];
}

class AccountTypeChanged extends AccountsEvent {
  final String type;
  AccountTypeChanged({
    @required this.type,
  }) : assert(type != null, "Ammount is Null");
  @override
  List<Object> get props => [type];
}

class AddAccountRequested extends AccountsEvent {
  AddAccountRequested();
  @override
  List<Object> get props => [];
}

class EmptyFields extends AccountsEvent {
  EmptyFields();
  @override
  List<Object> get props => [];
}

class AccountNameEmpty extends AccountsEvent {
  AccountNameEmpty();
  @override
  List<Object> get props => [];
}

class AccountNumberEmpty extends AccountsEvent {
  AccountNumberEmpty();
  @override
  List<Object> get props => [];
}

