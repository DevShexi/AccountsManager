import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final ammount;
  final date;
  final accountName;
  final accountNumber;
  TransactionCard(
      {this.ammount, this.date, this.accountName, this.accountNumber}) {
    // assert(ammount != null, "Ammount is Null");
    // assert(date != null, "Date is Null");
    // assert(accountName != null, "Account Name is Null");
    // assert(accountNumber != null, "AccountNumber is Null");
  }

  factory TransactionCard.fromJson(Map<String, dynamic> model) {
    return TransactionCard(
      ammount: model["ammount"],
      date: model["date"],
      accountName: model["accountName"],
      accountNumber: model["accountNumber"],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: accountName != "Inhand Transfer"
                      ? [
                          Text('$accountName' ?? "Account Name"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '$accountNumber' ?? "Account Number",
                            style: TextStyle(fontSize: 10),
                          ),
                        ]
                      : [
                          Text('$accountName' ?? "Account Name"),
                        ],
                )
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$ammount' ?? "Ammount",
                      style: TextStyle(
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$date' ?? "Date",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Icon(
                //     Icons.swap_horiz,
                //     color: Colors.green[800],
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
