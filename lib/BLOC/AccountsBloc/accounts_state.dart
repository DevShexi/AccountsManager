part of 'accounts_bloc.dart';

class AccountsState extends Equatable {
  final bool varified;
  final String accountType;
  final String accountName;
  final String accountNumber;
  final String ammount;
  final String accountNameError;
  final String accountNumberError;
  final String ammountError;
  AccountsState({
    @required this.varified,
    @required this.accountType,
    @required this.accountName,
    @required this.accountNumber,
    @required this.ammount,
    this.accountNameError,
    this.accountNumberError,
    this.ammountError,
  });
  AccountsState copyWith({
    varified,
    accountType,
    accountName,
    accountNumber,
    ammount,
    accountNameError,
    accountNumberError,
    ammountError,
  }) {
    final asd = AccountsState(
      varified: varified ?? this.varified,
      accountType: accountType ?? this.accountType,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      ammount: ammount ?? this.ammount,
      accountNameError: accountNameError ?? this.accountNameError,
      accountNumberError: accountNumberError ?? this.accountNumberError,
      ammountError: ammountError ?? this.ammountError,
    );
    return asd;
  }

  @override
  List<Object> get props => [
        varified,
        accountType,
        accountName,
        accountNumber,
        ammount,
        accountNameError,
        accountNumberError,
        ammountError
      ];
}
