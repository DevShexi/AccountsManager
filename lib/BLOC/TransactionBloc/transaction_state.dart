part of 'transaction_bloc.dart';

class TransactionState extends Equatable {
  final String fromAccount;
  final String ammount;
  final String ammountError;
  final String comments;
  TransactionState(
      {this.ammount, this.comments, this.fromAccount, this.ammountError});
  TransactionState copyWith({ammount, comments, fromAccount, ammountError}) {
    return TransactionState(
      ammount: ammount ?? this.ammount,
      comments: comments ?? this.comments,
      fromAccount: fromAccount ?? this.fromAccount,
      ammountError: ammountError ?? this.ammountError,
    );
  }

  @override
  List<Object> get props => [ammount, comments, fromAccount, ammountError];
}
