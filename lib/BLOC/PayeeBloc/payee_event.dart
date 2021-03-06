part of 'payee_bloc.dart';

class PayeeEvent extends Equatable {
  const PayeeEvent();
  @override
  List<Object> get props => [];
}

class PayeeNameChanged extends PayeeEvent {
  final name;
  PayeeNameChanged({this.name});
  List<Object> get props => [name];
}

class IsVirtualToggled extends PayeeEvent {
  final bool isVirtual;
  IsVirtualToggled({this.isVirtual});
  List<Object> get props => [isVirtual];
}

class PayeeAccountChanged extends PayeeEvent {
  final String accountName;
  PayeeAccountChanged({this.accountName});
}

class InvalidName extends PayeeEvent {
  InvalidName();
}

class NewPayeeAdded extends PayeeEvent {
  NewPayeeAdded();
}

class AddingPayee extends PayeeEvent {
  AddingPayee();
}
