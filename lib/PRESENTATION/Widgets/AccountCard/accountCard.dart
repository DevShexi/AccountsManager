import 'package:flutter/material.dart';

class AccountsCard extends StatelessWidget {
  AccountsCard({
    @required this.totalBalance,
    @required this.accountName,
    @required this.userName,
    @required this.accountNumber,
  });
  final totalBalance;
  final String accountName;
  final String userName;
  final String accountNumber;
  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(8.0),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(16),
      //   ),
      // ),
      //color: Colors.blueGrey[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Balance',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              totalBalance,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            accountName,
                            style: TextStyle(fontSize: 10),
                          ),
                          accountNumber != ""
                              ? Text(
                                  "****" +
                                      accountNumber
                                          .substring(accountNumber.length - 4),
                                  style: TextStyle(fontSize: 10),
                                )
                              : SizedBox(),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "User Name",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Icons.account_circle,
                  size: 28,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
