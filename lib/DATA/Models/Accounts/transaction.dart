import 'package:meta/meta.dart';

class Transaction {
  int id;
  DateTime when;
  String from;
  String sentTo;
  String ammount;
  String currency;
  String commments;

  Transaction({
    @required this.id,
    @required this.from,
    @required this.sentTo,
    @required this.ammount,
    @required this.currency,
    @required this.when,
  }) {
    assert(id != null, "ID is Empty");
    assert(from != null, "Paying Account Name is Empty");
    assert(sentTo != null, "Receiving Account Name is Empty");
    assert(ammount != null, "Transaction Ammount is Empty");
    assert(currency != null, "Currency is Empty");
    assert(when != null, "Transaction Date and Time are Empty");
  }

  factory Transaction.fromJson(Map<String, dynamic> data) {
    return new Transaction(
      id: data["id"],
      from: data["from"],
      sentTo: data["sentTo"],
      ammount: data["ammount"],
      currency: data["currency"],
      when: data["when"],
    );
  }
}
