import 'package:flutter/material.dart';
import 'package:myShop/PRESENTATION/Widgets/AccountCard/accountCard.dart';

class AccountsBuilder extends StatelessWidget {
  final List accountsList;
  AccountsBuilder({@required this.accountsList}) {
    assert(accountsList != null, "Accounts List is Null");
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, -3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          )),
      child: Column(
        children: [
          Container(
            height: 5,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: accountsList.length,
            itemBuilder: (context, index) {
              return AccountsCard(
                totalBalance: accountsList[index]['totalBalance'],
                userName: "Shexi",
                accountName: accountsList[index]['accountName'],
                accountNumber: accountsList[index]['accountNumber'],
              );
            },
          ),
        ],
      ),
    );
  }
}
