part of 'payee_bloc.dart';

class PayeeState extends Equatable {
  final String name;
  final String nameError;
  final bool virtual;
  final String account;
  final bool entered;
  PayeeState({
    @required this.name,
    @required this.account,
    this.virtual,
    this.nameError,
    this.entered,
  });

  PayeeState copyWith({name, account, virtual, nameError, entered}) {
    return PayeeState(
      name: name ?? this.name,
      account: account ?? this.account,
      virtual: virtual ?? this.virtual,
      nameError: nameError ?? this.nameError,
      entered: entered ?? this.entered,
    );
  }

  @override
  List<Object> get props => [name, account, virtual, nameError, entered];
}

class Loading extends PayeeState {
  Loading();
  @override
  List<Object> get props => [];
}

class Success extends PayeeState {
  Success();
  @override
  List<Object> get props => [];
}
