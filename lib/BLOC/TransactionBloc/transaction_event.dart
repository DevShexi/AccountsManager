part of 'transaction_bloc.dart';

class TransactionEvent extends Equatable {
  TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionAmmountChanged extends TransactionEvent {
  final String transactionAmmount;
  TransactionAmmountChanged({@required this.transactionAmmount});
  @override
  List<Object> get props => [transactionAmmount];
}

class TransactionCommentsChanged extends TransactionEvent {
  final String comments;
  TransactionCommentsChanged({this.comments});
  @override
  List<Object> get props => [comments];
}

class TransactionRequested extends TransactionEvent {
  TransactionRequested();
  @override
  List<Object> get props => [];
}

class FromAccountChanged extends TransactionEvent {
  final fromAccount;
  FromAccountChanged({this.fromAccount});
  @override
  List<Object> get props => [fromAccount];
}

class InvalidAmmount extends TransactionEvent {
  InvalidAmmount();
}
