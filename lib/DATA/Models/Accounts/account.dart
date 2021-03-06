import 'package:meta/meta.dart';

class Account {
  int id;
  String type;
  String accountName;
  String accountNumber;
  String totalBalance;
  String currency;
  DateTime lastDebit;
  DateTime lastCredit;

  Account(
      {@required this.id,
      @required this.type,
      @required this.accountName,
      @required this.accountNumber,
      this.totalBalance,
      @required this.currency,
      this.lastDebit,
      this.lastCredit}) {
    assert(id != null, "ID is Empty");
    assert(type != null, "Specify an Account Type");
    assert(accountName != null, "Account Name is Empty");
    assert(accountNumber != null, "Account Number is Empty");
    assert(currency != null, "Specify the Currency");
  }

  factory Account.fromJson(Map<String, dynamic> data) {
    return new Account(
      id: data["id"],
      type: data["type"],
      accountName: data["accountName"],
      accountNumber: data["accountNumber"],
      totalBalance: data["totalBalance"],
      currency: data["currency"],
      lastDebit: data["lastDebit"],
      lastCredit: data["lastCredit"],
    );
  }
}
